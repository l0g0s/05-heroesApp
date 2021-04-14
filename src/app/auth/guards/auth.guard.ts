import { Injectable } from '@angular/core';
import { CanActivate, CanLoad, Route, UrlSegment, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';
import { AuthService } from '../services/auth.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanLoad, CanActivate {

  constructor(private authService:AuthService,
              private route: Router ){}
  
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean> | Promise<boolean> {
      return this.verify()
  }

  canLoad(
    route: Route,
    segments: UrlSegment[]): Observable<boolean> | Promise<boolean> {
      return this.verify()
  }

  verify():Observable<boolean> {
    return this.authService.verificaAutentificacion()
    .pipe(
      tap( estaAutenticado => {
        if( !estaAutenticado ) {
          this.route.navigate(['./auth/login'])
        }
      })
    )
  }
}
