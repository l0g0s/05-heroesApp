import { Pipe, PipeTransform } from '@angular/core';
import { Heroe } from '../interfaces/heroes.interface';

@Pipe({
  name: 'imagen'
})
export class ImagenPipe implements PipeTransform {

  transform(h: Heroe, ...args: unknown[]): string {
    return `assets/heroes/${h.id}.jpg`;
  }

}
