# [Angular CLI](https://github.com/angular/angular-cli) version 11.2.1.

# TypeScript - ES2021

## `node_modules` generation
if *node_modules* is missing, execute:
```
npm install
```

## start server
to initialize app with node, execute: 
```
npm start
```
(Remember execute this command in the same folder where the file `package.json` is)

### change port
default port is ```8081```, you can change it in ```package.json``` >> scripts. There is the sentences to launch the server:
```
"start": "webpack-dev-server --mode development --open --port=8081"
```
simply change port.

TypesScript Types: - https://www.typescriptlang.org/docs/handbook/2/everyday-types.html  
`?` - Optional Properties  
`!` - Non-null assertion operator - https://www.typescriptlang.org/docs/handbook/release-notes/typescript-2-0.html#non-null-assertion-operator  

---

# AngularCLI

to create angularCLI app, execute:
```
ng new appName
```
- Enforce stricter type: `Y`
- Angular routing: `N or Y` for easy routing work
- Styles types: `CSS`
- ...can take a while...

## Development server

to start angularCLI development app, execute:
```
ng serve -o
```
` -o ` means to open server automaticly - or Navigate to `http://localhost:4200/`

to start angularCLI PRO app, execute:
```
ng build --prod
```
The build artifacts will be stored in `dist/`. Use `--prod` for production build.

## Code scaffolding

Run `ng generate component componentName` to generate a new component.   
You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`:  
```
ng g m moduleName
ng g c componentName --skip-tests -is
ng g pipe pipeName   --skip-tests
ng g s app/services/app --skip-tests
```
`--skip-tests` skip test generation -  `-is` skip styles (css) generation

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.

---

# Angular

## html - data flow:
` [xxx] ` one way exclusive from back to front - eg.`[name]`   
` (xxx) ` one way exclusive from front to back - eg.`(click)`  
`[(xxx)]` two way in-out - eg. `<input type="text" name="termino" [(ngModel)]="termino" placeholder="Buscar..."/>`

## input - recibe from other component
eg.: send to countries-table component listOfCountries by input:    
set in countries-table.component.ts:  
`@Input() countries: Country[] = []`  
set in parent html component:  
`<app-countries-table [countries]="listOfCountries"></app-countries-table>`  

## output - send to other   
eg.: declare output emitter  
`@Output() onEnter: EventEmitter<string> = new EventEmitter()`  
then when function find is called, emit data  
`find() { this.onEnter.emit( this.myData ) }`  

## locale Language-Country  
Go to `app.module.ts` and add    
```
import localeEs from '@angular/common/locales/es'
import { registerLocaleData } from '@angular/common'
registerLocaleData(localeEs)
...
  providers: [
    { provide: LOCALE_ID, useValue: 'es' }
  ],

```

## ngIf  
Eg.: `<div *ngIf="hayError"`

## ngFor  
Eg.: `<tr *ngFor="let item of items; let i = index">`

## Module and Component  
`ng new test` creates `app.module.ts`  
Generate new module: `ng g m testMod` creates `src/app/test-mod/test-mod.module.ts`  
Generate new component: `ng g c test-mod/testComp --skip-tests -is` creates `src/app/test-mod/test-comp/test-comp.component.ts`  
(also updates `test-mod.module.ts`)  
To show testComp in app component first export component in testMod module, then import module in app.module, the show testComp selector in app.component.html, like this:   
in `test-mod.module.ts` add: `exports:[TestCompComponent]`  
in `app.module.ts` add: `imports:[TestModModule]`  
in `app.component.html` add: `<app-test-comp></app-test-comp>`  

## routing  
- create `app-routing.module.ts` - to show components on route  
- import special way: `import RouterModule.forRoot(routes)`  
- and export too: `export RouterModule`  
- generate routes:  
``` 
const routes: Routes = [{ 
        path: '', component: PorPaisComponent, pathMatch: 'full' 
    },{ path: 'region', component: PorRegionComponent 
    },{ path: 'pais/:Code', component: VerPaisComponent }] 
```
- import `AppRoutingModule` where its going to be used (or `RouterModule`)  
- in html use this: `<router-outlet></router-outlet>` where component should appear     
- if reference in ***sidebar***  
```
    <li routerLink="region"  
        routerLinkActive="active"  
        [routerLinkActiveOptions]="{exact: true}"  
        class="list-group-item">  
        Buscar país  
    </li>  
```
- if reference from other ***component***  
First reference like this:  
eg.: `<a [routerLink]="['/country', p.id]">See country</a>`  
Then obtain reference in component eg.: `country-component.ts` like this:  
```
  myId!: String
  constructor(  private activatedRoute: ActivatedRoute ) { }
  ngOnInit(): void { this.activatedRoute.params.subscribe(  ({ id }) => this.myId = id ) }  
```

## routing lazyLoad  
create sub routing module and generate children, eg.:  
```
const routes: Routes = [{
    path:'',
    children: [{ path:'login',
        component: LoginComponent
      }]
    }]
  ...
@NgModule({
  imports: [ RouterModule.forChild( routes ) ],
  exports: [ RouterModule ]
```
then inform child routes for eg.:`/auth/` to be lazyLoad in `app-routing.module.ts`  
```
const routes: Routes = [  {
    path: 'auth',
    loadChildren: () => import('./auth/auth.module').then( m => m.AuthModule ) },
```
Tarea Lazy-load: https://gist.github.com/Klerith/c72ea2d4192567cb42a0f62e5d271724  


## httpRequests
In app.module.ts `import HttpClientModule` desde `import { HttpClientModule } from '@angular/common/http';`  
In ***service*** import httpClient like this: `constructor(private http:HttpClient){`  
Optional set params eg.:
```
    const params = new HttpParams().set('key',this.value)
``` 
In function make http GET and then subscript, eg.:  
```
    this.http.get<SearchGifsResponse>(`${this.serviceUrl}/search`,{params})
      .subscribe( (resp) =>{
        this.resultados = resp.data
      })  
```

## Pipes
https://angular.io/api?query=pipe



---

# GIT

Repository in https://github.com/
- In github create new repository eg.`angular-basicos` https://github.com/l0g0s/angular-basicos.git
- In local start/reset repository
```
git init
git add . // add all
git commit -m "first commit"
```
- PUSH:
```
git remote add origin https://github.com/l0g0s/angular-basicos.git
git branch -M master
git push -u origin master
```
- TAG
```
git tag -a v0.1.0 -m "Fin sección 4"
git tag
git push --tags
```
to convert it to release tag in github.com select the tag, select version, select edit, set name and press "update release"

---

# Notes

## VSCode

VSCode debugger: F5

## JavaScript

aboid send by reference, example:
```
   return [...this.myList]
```
`...` operator *spread*. -> Separates each element of the array and create a new one.
See more: https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Operators/Spread_syntax

LocalStorage and SessionStorage lets you save information in navegator
```
localStorage.setItem("historial",JSON.stringify(this._historial))
this._historial = JSON.parse( localStorage.getItem("historial")! ) || []
```

## array sort
https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Global_Objects/Array/sort

## netlify - web server  
https://www.netlify.com/

## bootstrap - styles  
https://getbootstrap.com/
shortcut: write `.row` + TAB -> writes: `<div class="row"></div>`
same with `.col` ...

## developers.giphy.com - GIFs finder with API
https://developers.giphy.com/
https://developers.giphy.com/docs/api/endpoint#search

## quicktype.io - converts Json to anything
https://quicktype.io/  
- language TypeScript  
- interfaces only  
- verify JSON  

## animate.style - animated styles to make nicer webs
https://animate.style/

## restcountries.eu - API countries of the world
https://restcountries.eu/#api-endpoints-name

## primeNG - library/framework for angular  
https://www.primefaces.org/primeng/  
npm install primeng --save  
npm install primeicons --save  
add in angular.json:  
```
            "styles": [
              "src/styles.css",
              "node_modules/primeicons/primeicons.css",
              "node_modules/primeng/resources/themes/saga-blue/theme.css",
              "node_modules/primeng/resources/primeng.min.css"              
            ],
```

## material angular io - library/framework for angular  
https://material.angular.io/  
ng add @angular/material  
`purple-green,y,y`  
Material icons  
https://material.io/resources/icons/?icon=bookmark&style=baseline  

## flex-layout - table view library for angular  
https://www.npmjs.com/package/@angular/flex-layout  
npm i @angular/flex-layout
https://github.com/angular/flex-layout    
npm i -s @angular/flex-layout @angular/cdk  

## JSON Server  
Get a full fake REST API with zero coding  
https://www.npmjs.com/package/json-server   
install server:  
npm install -g json-server  
start server:  
json-server --watch db.json  

## CRUD - Create Read Update Delete  