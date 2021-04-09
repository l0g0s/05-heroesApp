import { Pipe, PipeTransform } from '@angular/core';
import { Heroe } from '../interfaces/heroes.interface';

@Pipe({
  name: 'imagen',
  pure: false
})
export class ImagenPipe implements PipeTransform {

  transform(h: Heroe, ...args: unknown[]): string {
    if(!h.id) { 
      return `assets/no-image.png`;
    }else if ( h.alt_img ) {
      return h.alt_img
    }
    return `assets/heroes/${h.id}.jpg`;
  }

}
