Courier APÏ 
===========
### Welcome! have a quick read of this

hi, this is a college made API for a particular problem, most of the things implemented here were made 
with testing and learning purposes, so, dont be too harsh, that said, most of the things were made simple
so they can be used as references to another Apps on development.

> ## How to make it run or test at least
>  1. Clone the git proyect, or download it, however you want
>  2. Get into the proyect folder via command terminal (did you unzip it, right?)
>  3. run ` gem install rails-api` (if theres a problem here, you should check if ruby is installed)
>  4. run ` rbenv rehash`  (well, maybe those last two werent not really necesary...)
>  5. run `  bundle install` 
>  6. run ` rake db:create` (just in case...)
>  7. run ` rake db:migrate` (at this point, if nothing has exploded, we are fine XD)
>  8. run ` rake db:seed` (just populating the database a little bit)
>  9. run ` rails server` (now, everything should be ready to test on localhost:3000)
>
> ## anything special you should know? 
> * this API renders no views, so dont look for them
> * API calls are made RESTFULL way (keep reading eventually i will describe the endpoints of the API)
> * theres two ways to access the API services, via  ` http://localhost:3000/api/v1/<resource>` or ` http://localhost:3000/<resource>`
> * keeping the track of the last point, api/v1/ requires no **token** via headers to give service, just so you can test the calls
> * since theres a lot of url calls, you can use **Postman** (a chrome aplication) to help you keep track
> * if you got postman, theres a import file called  `Postman_examples` in the proyect root to help you out testing with examples
> * most GET call can return both .xml and .json formats but will return json by default if not specified
> * the API responds with json to most calls, or http headers on most unsuccessfull cases
>

well, if you are curious about which App is this API giving service, check:  [link to_app_rep](https://github.com/torreta/CourierApp).

Endpoints Overview
------------------

  it may sound weird but, since calls on ` http://localhost:3000/<resource>` require a validation token, heres the way to obtain it...
  
  POST   ` http://localhost:3000/api_key` with header values on the call "email" and "password", you can use the default email: 'example@gmail.com' and password:'12345'

### resources 
   `/api/v1` actions: **index**, **create**, **show**, **update**, **destroy**
   
- Agencies 
* Users  
- Packages
+ Rates
* Api_key (create, destroy)
* Prices (not actually a resource, but it calculates the cost of a package)

Endpoints Specifics
-------------------

>## Agencies
>
> **Verb**   **URI Pattern**
> - *GET*
>    * `/api/v1/agencies(.json,.xml)`
>    * **success**: *status*: *ok*, return all agencies on the specified format
>    * **error**: *status:  bad_request*, blank page
> - *POST*                                                                                                 
>    * `/api/v1/agencies`
>    * **params**:`name:string, phone:string, address:string`
>    * **success**: *status*: *created*, return the *json* of the created object
>    * **error**: *status*: *unprocessable_entity*, blank page
> - *GET*                                                                                                           
>    *  ` /api/v1/agencies/:id `
> - *PATCH*
>    *  ` /api/v1/agencies/:id `
> - *PUT*       
>    *  ` /api/v1/agencies/:id `
> - *DELETE*    
>    *  ` /api/v1/agencies/:id `
>


