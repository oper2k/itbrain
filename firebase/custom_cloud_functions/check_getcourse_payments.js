const functions = require("firebase-functions");
const admin = require("firebase-admin");
const mode = "single"; // Задаём режим работы функции single/package/subscription

// Функция для Cloudpayments
exports.checkGetcoursePayments = functions.https.onRequest(async (req, res) => {
  const orderId = req.body.InvoiceId;
  const status = req.body.Status;
  const cancelCode = req.body.ReasonCode || false;
  const cancelReason = req.body.Reason || false;

  console.log("Received request with orderId:", orderId, "and status:", status);

  if (!orderId) {
    console.error("Error: Missing order_id parameter");
    res.status(200).json({ code: 0, message: "Не указан параметр order_id" });
  } else {
    const db = admin.firestore();
    const orderRef = db.collection("orders").doc(orderId);

    // Получаем данные заказа
    const orderSnapshot = await orderRef.get();
    const orderData = orderSnapshot.data();

    if (!orderSnapshot.exists) {
      console.error("Error: Order document not found");
      res.status(200).json({ code: 0, message: "Документ заказа не найден" });
      return;
    }

    if (orderData.status === "succeeded") {
      console.log('Payment status is already "succeeded"');
      res
        .status(200)
        .json({ code: 0, message: 'Статус платежа уже "succeeded"' });
      return;
    }

    if (status === "Completed" || status === "Active") {
      try {
        await orderRef.update({ status: "succeeded" });

        console.log('Order status updated to "succeeded"');

        // Извлекаем client_id из заказа
        const client_id = orderData.client_id.toString();

        // Ищем пользователя по ID документа в коллекции /users
        const userRef = db.collection("/users").doc(client_id);
        const userDoc = await userRef.get();

        if (mode === "package") {
          // Получаем ID товара из заказа
          const purchasedProductReference = orderData.purchased_product_ID;
          let productRef = null;

          if (
            purchasedProductReference instanceof
            admin.firestore.DocumentReference
          ) {
            productRef = purchasedProductReference;
          }

          // Проверяем, что productRef не равен null
          if (productRef) {
            if (userDoc.exists) {
              // Получаем текущий массив purchased_products или создаем новый массив
              const purchasedProductsArray =
                userDoc.get("purchased_products") || [];
              if (!purchasedProductsArray.includes(productRef)) {
                purchasedProductsArray.push(productRef);
                await userRef.update({
                  purchased_products: purchasedProductsArray,
                });
                console.log("Purchased product added to user profile");
              }
              res
                .status(200)
                .json({ code: 0, message: "Статус платежа успешно обновлен" });
              return;
            } else {
              console.error("Error: User not found in /users collection");
              res
                .status(200)
                .json({
                  code: 0,
                  message: "Пользователь не найден в коллекции /users",
                });
              return;
            }
          } else {
            console.error("Error: Product link not found in the order");
            res
              .status(200)
              .json({
                code: 0,
                message: "Ссылка на товар не найдена в заказе",
              });
            return;
          }
        } else if (mode === "single") {
          if (userDoc.exists) {
            // Обновляем статус заказа
            await orderRef.update({ status: "succeeded" });
            // Обновляем поле isPremium
            await userRef.update({ isBuy: true });
            console.log('User status updated to "isBuy: true"');
            res
              .status(200)
              .json({ code: 0, message: "Статус платежа успешно обновлён" });
            return;
          } else {
            console.error("Error: User not found in /users collection");
            res
              .status(200)
              .json({
                code: 0,
                message: "Пользователь не найден в коллекции /users",
              });
            return;
          }
        } else if (mode === "subscription") {
          if (userDoc.exists) {
            // Обновляем дату подписки
            await userRef.update({
              subscriptionExpDate: req.body.NextTransactionDate,
            });
            console.log(
              "Subscription status updated with next transaction date:",
              req.body.NextTransactionDate,
            );
            res
              .status(200)
              .json({ code: 0, message: "Статус подписки успешно обновлён" });
            return;
          } else {
            console.error("Error: User not found in /users collection");
            res
              .status(200)
              .json({
                code: 0,
                message: "Пользователь не найден в коллекции /users",
              });
            return;
          }
        }
      } catch (error) {
        console.error("Error updating document:", error.message);
        res
          .status(200)
          .json({
            code: 0,
            message: `Произошла ошибка при обновлении документа: ${error.message}`,
          });
        return;
      }
    } else if (cancelReason) {
      try {
        await orderRef.update({
          status: "cancelled",
          description: `${cancelCode}. ${cancelReason}`,
        });
        console.log('Order status updated to "cancelled"');
        res
          .status(200)
          .json({
            code: 0,
            message: "Статус платежа успешно отменён и обновлён",
          });
        return;
      } catch (error) {
        console.error("Error updating document:", error.message);
        res
          .status(200)
          .json({
            code: 0,
            message: `Произошла ошибка при обновлении документа: ${error.message}`,
          });
        return;
      }
    }
  }
});
