import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute, Router } from '@angular/router';
import { Heroe, Publisher } from '../../interfaces/heroes.interface';
import { HeroesService } from '../../services/heroes.service';
import { ConfirmarComponent } from '../../components/confirmar/confirmar.component';

@Component({
  selector: 'app-agregar',
  templateUrl: './agregar.component.html',
  styles: [`
    img{width: 100%;border-radius:5px;}
  `]
})
export class AgregarComponent implements OnInit {

  heroe: Heroe = { 
    superhero:"",
    publisher: Publisher.DCComics,
    alter_ego: "",
    first_appearance: "",
    characters: ""
  }

  publishers = [ {
      id: Publisher.MarvelComics,
      desc: "Marvel Comics"
    },
    {
      id: Publisher.DCComics,
      desc: "DC Comics"
    } ]

    durationInSeconds = 2;

    constructor( private heroeService: HeroesService,
               private activatedRoute: ActivatedRoute,
               private router: Router,
               private snackBar: MatSnackBar,
               private dialog: MatDialog) { }

  ngOnInit(): void {

    if(this.router.url.includes('agregar')) return
    this.activatedRoute.params
    //   .pipe ( switchMap( ({id}) => this.heroeService.getHeroePorId(id) ) )
    //   .subscribe( heroe => this.heroe = heroe )
    .subscribe( ({id}) => this.heroeService.getHeroePorId(id)
    .subscribe( heroe => this.heroe = heroe )
    )
  }

  mostrarSnackBar(mensaje:string) {
    this.snackBar.open(mensaje,'Ok!', {
      duration: this.durationInSeconds * 1000,
    });
  }  

  guardar() {
    if(this.heroe.superhero.trim().length==0) { 
      return 
    }
    
    if (this.heroe.id) {
      //actualizar
      this.heroeService.actualizarHeroe( this.heroe )
        .subscribe( heroe => {
          this.heroe = heroe
          this.mostrarSnackBar('Registro actualizado')
        })
    } else {
      //insertar
      this.heroeService.agregarHeroe(this.heroe)
        .subscribe( heroe => { 
            this.router.navigate(["/heroes/editar",heroe.id])
            this.mostrarSnackBar('Registro creado')
          })
    } 
  }

  borrar() {
    const dialog = this.dialog.open(ConfirmarComponent,{
      width: '250px',
      data: {...this.heroe}
    })
    dialog.afterClosed().subscribe(
      (result) => {
      if(result){
        this.heroeService.borrarHeroe(this.heroe)
        .subscribe(resp => { this.router.navigate(["/heroes"]) })  
      }
  })
}

}
