"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
/* Defines the SignUp entity */
var SignUp = (function () {
    function SignUp() {
    }
    return SignUp;
}());
exports.SignUp = SignUp;
/* Defines the Vendor entity */
var Vendor = (function () {
    function Vendor() {
    }
    return Vendor;
}());
exports.Vendor = Vendor;
/* Defines the SignUp entity */
var SignIn = (function () {
    function SignIn() {
    }
    return SignIn;
}());
exports.SignIn = SignIn;
/* Defines the Customer entity */
var Customer = (function () {
    function Customer() {
    }
    return Customer;
}());
exports.Customer = Customer;
/* Defines the Food entity */
var Food = (function () {
    function Food() {
    }
    return Food;
}());
exports.Food = Food;
/* Defines the Order entity */
var Order = (function () {
    function Order() {
    }
    return Order;
}());
exports.Order = Order;
/* Defines the OrderDetail entity */
var OrderDetail = (function () {
    function OrderDetail() {
    }
    return OrderDetail;
}());
exports.OrderDetail = OrderDetail;
/* Defines the OrderStatus entity */
var OrderStatus = (function () {
    function OrderStatus() {
        this.Order = new Order();
        this.Customer = new Customer();
        this.OrderedItems = new Array();
    }
    return OrderStatus;
}());
exports.OrderStatus = OrderStatus;
/* Defines the Payment entity */
var OrderStatusData = (function () {
    function OrderStatusData() {
    }
    return OrderStatusData;
}());
exports.OrderStatusData = OrderStatusData;
/* Defines the Payment entity */
var Payment = (function () {
    function Payment() {
    }
    return Payment;
}());
exports.Payment = Payment;
/* Defines the PayOrder entity */
var PayOrder = (function () {
    function PayOrder() {
    }
    return PayOrder;
}());
exports.PayOrder = PayOrder;
/* Defines the Site entity */
var Site = (function () {
    function Site() {
    }
    return Site;
}());
exports.Site = Site;
/* Defines the VendorMenu entity */
var VendorMenu = (function () {
    function VendorMenu() {
    }
    return VendorMenu;
}());
exports.VendorMenu = VendorMenu;
//# sourceMappingURL=AppModels.js.map