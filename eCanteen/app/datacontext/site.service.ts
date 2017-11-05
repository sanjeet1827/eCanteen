﻿import { Injectable } from '@angular/core';
import { Http, Response } from '@angular/http';

import { Observable } from 'rxjs/Observable';

import 'rxjs/add/operator/do';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';
import 'rxjs/add/observable/throw';

import { ISite } from '../Types/ISite'
import { ISiteService } from '../Types/ISiteService'

@Injectable()
export class SiteService implements ISiteService {

    private _siteUrl = 'api/products/products.json';

    constructor(private _http: Http) { }

    getSites(): Observable<ISite[]> {
        return this._http.get(this._siteUrl)
            .map((response: Response) => <ISite[]>response.json())
            .do(data => console.log('All: ' + JSON.stringify(data)))
            .catch(this.handleError);
    }

    private handleError(error: Response) {
        // in a real world app, we may send the server to some remote logging infrastructure
        // instead of just logging it to the console
        console.error(error);
        return Observable.throw(error.json().error || 'Server error');
    }
}