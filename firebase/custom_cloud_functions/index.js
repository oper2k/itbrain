const admin = require("firebase-admin/app");
admin.initializeApp();

const checkGetcoursePayments = require("./check_getcourse_payments.js");
exports.checkGetcoursePayments = checkGetcoursePayments.checkGetcoursePayments;
