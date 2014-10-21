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
>    * `/api/v1/agencies(.json,.xml)` (search by phone)
>    * **params**: `phone:string` 
>    * **success**: *status*: *ok*, returns the agenciy found
>    * **error**: *status:  not_found*, blank page
> - *POST*                                                                                                 
>    * `/api/v1/agencies`
>    * **params**:`name:string, phone:string, address:string`
>    * **success**: *status*: *created*, return the *json* of the created object
>    * **error**: *status*: *unprocessable_entity*, blank page
> - *GET*                                                                                                           
>    *  ` /api/v1/agencies/:id(.json,.xml)` (:id, is the index of the *created* object)
>    * **success**: *status*: *ok*, return the *json* of the especified entity
>    * **error**: *status*: *bad_request*, blank page
> - *PUT* / *PATCH*
>    *  ` /api/v1/agencies/:id ` (:id, is the index of the *created* object)
>    * **params**:`name:string` / `phone:string` / `address:string`
>    * **success**: *status*: *accepted*, return the *json* of the updated object
>    * **error**: *status*: *bad_request*, blank page
> - *DELETE*    
>    *  ` /api/v1/agencies/:id ` (:id, is the index of the *created* object)
>    * **success**: *status*: *accepted*, black page (the object was deleted)
>    * **error**: *status*: *no_content*, blank page (no object to delete)
>

>## Rates
>
> **Verb**   **URI Pattern**
> - *GET*
>    * `/api/v1/rates(.json,.xml)`
>    * **success**: *status*: *ok*, return all rates on the specified format
>    * **error**: *status:  bad_request*, blank page
> - *POST*                                                                                                 
>    * `/api/v1/rates`
>    * **params**:`creator_id:integer constant:decimal K_value:decimal `
>    * **success**: *status*: *created*, return the *json* of the created object
>    * **error**: *status*: *unprocessable_entity*, blank page
> - *GET*                                                                                                           
>    *  ` /api/v1/rates/:id ` (:id, is the index of the *created* object)
>    * **success**: *status*: *ok*, return the *json* of the especified entity
>    * **error**: *status*: *bad_request*, blank page
> - *PUT* / *PATCH*       
>    *  ` /api/v1/rates/:id ` (:id, is the index of the *created* object)
>    * **params**:`creator_id:integer`/` constant:decimal`/ `K_value:decimal `
>    * **success**: *status*: *accepted*, return the *json* of the updated object
>    * **error**: *status*: *bad_request*, blank page
> - *DELETE*    
>    *  ` /api/v1/rates/:id ` (:id, is the index of the *created* object)
>    * **success**: *status*: *accepted*, black page (the object was deleted)
>    * **error**: *status*: *no_content*, blank page (no object to delete)
>

>## Users
>
> **Verb**   **URI Pattern**
> - *GET*
>    * `/api/v1/users(.json,.xml)`
>    * **success**: *status*: *ok*, return all users on the specified format
>    * **error**: *status:  bad_request*, blank page
>    * `/api/v1/users(.json,.xml)` (search by email)
>    * **params**:`email:string`
>    * **success**: *status*: *ok*, return the user found
>    * **error**: *status:  not_found*, blank page
>    * `/api/v1/users(.json,.xml)` (search by cedula)
>    * **params**:`cedula:string`
>    * **success**: *status*: *ok*, return the user found
>    * **error**: *status:  not_found*, blank page
> - *POST*                                                                                                 
>    * `/api/v1/users`
>    * **params**:`email:string password:string role:string cedula:string name:string lastname:string phone:string`
>    * **success**: *status*: *created*, return the *json* of the created object
>    * **error**: *status*: *unprocessable_entity*, blank page
> - *GET*                                                                                                           
>    *  ` /api/v1/users/:id(.json,.xml) ` (:id, is the index of the *created* object)
>    * **success**: *status*: *ok*, return the *json* of the especified entity
>    * **error**: *status*: *bad_request*, blank page
> - *PUT* / *PATCH*
>    *  ` /api/v1/users/:id ` (:id, is the index of the *created* object)
>    * **params**:`email:string`/` password:string`/` role:string`/ `cedula:string`/` name:string` /`lastname:string`/` phone:string`
>    * **success**: *status*: *accepted*, return the *json* of the updated object
>    * **error**: *status*: *bad_request*, blank page
> - *DELETE*    
>    *  ` /api/v1/users/:id ` (:id, is the index of the *created* object)
>    * **success**: *status*: *accepted*, black page (the object was deleted)
>    * **error**: *status*: *no_content*, blank page (no object to delete)
>

>## Packages
>
> **Verb**   **URI Pattern**
> - *GET*
>    * `/api/v1/packages(.json,.xml)`
>    * **success**: *status*: *ok*, return all packages on the specified format
>    * **error**: *status:  bad_request*, blank page
> - *POST*                                                                                                 
>    * `/api/v1/packages`
>    * **params**:`sender_id:integer receiver_id:integer sender_agency_id:integer receiver_agency_id:integer status:string dispatched_at:datetime delivered_at:datetime lenght:decimal width:decimal height:decimal weight:decimal value:decimal`
>    * **success**: *status*: *created*, return the *json* of the created object
>    * **error**: *status*: *unprocessable_entity*, blank page
> - *GET*                                                                                                           
>    *  ` /api/v1/packages/:id(.json,.xml)` (:id, is the index of the *created* object)
>    * **success**: *status*: *ok*, return the *json* of the especified entity
>    * **error**: *status*: *bad_request*, blank page
> - *PUT* / *PATCH*
>    *  ` /api/v1/packages/:id ` (:id, is the index of the *created* object)
>    * **params**:`sender_id:integer`/` receiver_id:integer`/` sender_agency_id:integer`/` receiver_agency_id:integer`/` status:string`/` dispatched_at:datetime`/` delivered_at:datetime`/` lenght:decimal`/` width:decimal`/` height:decimal`/` weight:decimal`/` value:decimal`
>    * **success**: *status*: *accepted*, return the *json* of the updated object
>    * **error**: *status*: *bad_request*, blank page
> - *DELETE*    
>    *  ` /api/v1/packages/:id ` (:id, is the index of the *created* object)
>    * **success**: *status*: *accepted*, black page (the object was deleted)
>    * **error**: *status*: *no_content*, blank page (no object to delete)
>

>## Token Request
>
> **Verb**   **URI Pattern**
> - *POST*                                                                                                 
>    * `/api_key`
>    * **headers**:`email:string password:string`
>    * **success**: *status*: *created*, return the *json* of the created object
>    * **error**: *status*: *unauthorized*, blank page, invalid user
>    * **error**: *status*: *bad_request*, blank page, posible header problem
> - *DELETE*    
>    *  ` /api_key/:id ` (:id, is the index of the *created* token)
>    * **success**: *status*: *accepted*, black page (the object was deleted)
>    * **error**: *status*: *no_content*, blank page (no object to delete)
>    * **error**: *status*: *unauthorized*, blank page (no object to delete)
>    * **error**: *status*: *no_content*, maybe token was expired (no object to delete)
>

>## Pricing
>
> **Verb**   **URI Pattern**
> - *GET*                                                                                                 
>    * `/price`
>    * **params**:`lenght:decimal width:decimal height:decimal weight:decimal value:decimal`
>    * **success**: *status*: *ok*, return the cost of the package in *string*
>    * **error**: *status*: *bad_request*, blank page
>

>## With token auth
>
> **Aplies all the routes mentioned before, but these are on the routes** `/<resource>`**and requires, the additional header** *token* **that you** *Obtain*,**making a** *token_request* **explained before, applies on all request except on price, for that API route** 
>
