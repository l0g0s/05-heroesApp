import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Heroe } from '../interfaces/heroes.interface';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class HeroesService {

  constructor( private http: HttpClient) { }

  getHeroes(): Observable<Heroe[]> {
     return this.http.get<Heroe[]>( `${environment.baseUrl}/heroes`)
  }

  getHeroePorId(id:string): Observable<Heroe> {
    return this.http.get<Heroe>(`${environment.baseUrl}/heroes/${id}`)
  }

  buscarHeroes(id:string): Observable<Heroe[]> {
    return this.http.get<Heroe[]>( `${environment.baseUrl}/heroes?q=${id}&_limit=6`)
 }

 agregarHeroe(heroe:Heroe): Observable<Heroe> {
  return this.http.post<Heroe>(`${environment.baseUrl}/heroes`,heroe)
 }

 actualizarHeroe(heroe:Heroe): Observable<Heroe> {
  return this.http.put<Heroe>(`${environment.baseUrl}/heroes/${heroe.id}`,heroe)
 }

 borrarHeroe(heroe:Heroe): Observable<any> {
  return this.http.delete<any>(`${environment.baseUrl}/heroes/${heroe.id}`)
 }

}
