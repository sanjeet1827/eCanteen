import { ComponentFixture, TestBed, ComponentFixtureAutoDetect, async } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { RouterModule, Router } from '@angular/router';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { BrowserModule, DomSanitizer } from '@angular/platform-browser';
import { Observable } from 'rxjs/Observable';

import { TextboxGeneralComponent } from '../../directives/textboxgeneral.component';
import { ButtonComponent } from '../../directives/button.component';
import { SignupSinginComponent } from './signupSignin.component';
import { SinginComponent } from './Signin.component';
import { ISite } from '../../Types/ISite';
import { ISiteService } from '../../Types/ISiteService';

import { SiteService } from '../../datacontext/site.service';
import { VendorService } from '../../datacontext/vendor.service';
import { httpHelper } from '../../Helpers/httpHelper';
let mockSites: ISite[];
mockSites = [{ Id: "1", Name: "", address: "", contact: "", owner: 1 }];
let FakeSiteService = {
  getSites(): Observable<ISite[]> {
    let sitesObservable: Observable<ISite[]> = new Observable<ISite[]>();
    return sitesObservable
      .do(data => console.log('All: ' + JSON.stringify(mockSites)))
  }
}

describe('SignupSinginComponent (template)', () => {

  let comp: SignupSinginComponent;
  let fixture: ComponentFixture<SignupSinginComponent>;
  let de: DebugElement;
  let el: HTMLElement;
  let spy: any;
  let testSites: any;
  let testLoginVendor: any;
  let fakeHttpHelper: any = {}
  let FakeSiteService: ISiteService;


  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [FormsModule, BrowserModule, HttpClientModule, RouterModule],
      declarations: [SignupSinginComponent, SinginComponent, TextboxGeneralComponent, ButtonComponent], // declare the test component
      providers: [
        { provide: SiteService, use: FakeSiteService },
        { provide: VendorService, use: VendorService },
        { provide: httpHelper, use: fakeHttpHelper }
      ]
    })

    fixture = TestBed.createComponent(SignupSinginComponent);

    comp = fixture.componentInstance;

  });


  it('head element should be defined', () => {
    comp.activeLoginView(false);
    fixture.detectChanges();
    de = fixture.debugElement.nativeElement;
    //de = fixture.debugElement.query(By.css('animate-if vendor-gate'));
    //el = de.nativeElement;

    expect(de).toBeDefined(true);
  });

});
