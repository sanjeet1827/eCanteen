"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
var core_1 = require("@angular/core");
var platform_browser_1 = require("@angular/platform-browser");
var http_1 = require("@angular/http");
var http_2 = require("@angular/common/http");
var router_1 = require("@angular/router");
var animations_1 = require("@angular/platform-browser/animations");
var forms_1 = require("@angular/forms");
var app_component_1 = require("./app.component");
var header_component_1 = require("./common/header.component");
var footer_component_1 = require("./common/footer.component");
// directives
var button_component_1 = require("./directives/button.component");
var textboxdecimal_component_1 = require("./directives/textboxdecimal.component");
var textboxgeneral_component_1 = require("./directives/textboxgeneral.component");
var customer_service_1 = require("./datacontext/customer.service");
var food_service_1 = require("./datacontext/food.service");
var notification_service_1 = require("./datacontext/notification.service");
var order_service_1 = require("./datacontext/order.service");
var pay_service_1 = require("./datacontext/pay.service");
var site_service_1 = require("./datacontext/site.service");
var vendor_service_1 = require("./datacontext/vendor.service");
var RequestOptionsService_1 = require("./datacontext/RequestOptionsService");
var httpHelper_1 = require("./Helpers/httpHelper");
var decimal_input_directive_1 = require("./directives/decimal-input.directive");
var signupSignin_component_1 = require("./viewcontroller/vendor/signupSignin.component");
/* Feature Modules */
//import { ProductModule } from './products/product.module';
var AppModule = (function () {
    function AppModule() {
    }
    return AppModule;
}());
AppModule = __decorate([
    core_1.NgModule({
        imports: [
            platform_browser_1.BrowserModule,
            http_1.HttpModule,
            http_2.HttpClientModule,
            animations_1.BrowserAnimationsModule,
            forms_1.FormsModule,
            router_1.RouterModule.forRoot([
                //{ path: 'home', /*component: HomeComponent*/ },
                { path: '', component: signupSignin_component_1.SignupSinginComponent, pathMatch: 'full' },
            ])
        ],
        declarations: [
            app_component_1.AppComponent,
            header_component_1.HeaderComponent,
            footer_component_1.FooterComponent,
            button_component_1.ButtonComponent,
            textboxdecimal_component_1.TextboxDecimalComponent,
            textboxgeneral_component_1.TextboxGeneralComponent,
            decimal_input_directive_1.DecimalInputDirective,
            signupSignin_component_1.SignupSinginComponent
        ],
        providers: [
            customer_service_1.CustomerService,
            food_service_1.FoodService,
            notification_service_1.NotificationService,
            order_service_1.OrderService,
            pay_service_1.PayService,
            site_service_1.SiteService,
            vendor_service_1.VendorService,
            httpHelper_1.httpHelper,
            { provide: http_1.RequestOptions, useClass: RequestOptionsService_1.RequestOptionsService }
        ],
        bootstrap: [app_component_1.AppComponent]
    })
], AppModule);
exports.AppModule = AppModule;
//# sourceMappingURL=app.module.js.map