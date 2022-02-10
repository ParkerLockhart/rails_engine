# RAILS ENGINE API

Welcome to version 1 of Rails Engine API. Below you will find a list of available endpoints.

<details>
  <summary>Merchants (click to expand)</summary>

  - [Get All Merchants](#get-all-merchants)
  - [Get Merchant Details](#get-merchant-details)
  - [Get Merchant Items](#get-merchant-items)
  - [Find A Merchant](#find-a-merchant)

 </details>


 <details>
  <summary>Items (click to expand)</summary>

  - [Get All Items](#get-all-items)
  - [Get Item Details](#get-item-details)
  - [Create Item](#create-item)
  - [Delete Item](#delete-item)
  - [Update Item](#update-item)
  - [Search For Items](#search-for-items)

 </details>




## Get All Merchants
  Get a list of all merchants in the database.  

  GET http://localhost:3000/api/v1/merchants

  ### Responses

    <details>
      <summary> 200 OK </summary>

      ```
       {
         data: [
          {
            id: String,
            type: "merchant",
            attributes: {
              name: String
              }
             },
             id: String,
             type: "merchant",
             attributes: {
              name: String
              }
            }
          ]
        }

      ```
    <details>


## Get Merchant Details
  Get the primary information about a merchant.

  GET http://localhost:3000/api/v1/merchants/{merchant_id}

  ### Path Parameters

   | param | data type | value | required/optional |
   |---|---|---|---|
   | merchant_id | integer | valid resource id | required |

 ### Responses

  <details>
    <summary>  200 OK </summary>

    ```
        {
          data: {
              id: String,
              type: "merchant",
              attributes: {
                  name: String
              }
          }
      }
    ```
  </details>

  <details>
    <summary> 404 Not Found </summary>


    ```
     Error
    ```
  </details>

## Get Merchant Items
  Get all items that belong to a merchant.

  GET http://localhost:3000/api/v1/merchants/{merchant_id}/items

  ### Path Parameters

  | param | data type | value | required/optional |
  |---|---|---|---|
  | merchant_id | integer | valid resource id | required |

  ### Responses

  <details>
    <summary> 200 OK </summary>

    ```
      {
        data: [
            {
                id: String,
                type: "item",
                attributes: {
                    name: String,
                    description: String,
                    unit_price: Float,
                    merchant_id: Integer
                }
            },
            {
                id: String,
                type: "item",
                attributes: {
                    name: String,
                    description: String,
                    unit_price: Float,
                    merchant_id: Integer
                }
            }
        ]
      }
    ```
  </details>

  <details>
    <summary> 404 Not Found </summary>

    ```
      Error
    ```
  </details>

## Find A Merchant
  Search merchants in the database by name.

  GET http://localhost:3000/api/v1/merchants/find?name={query}

  ### Path Parameters

     | param | data type | value | required/optional |
   |---|---|---|
   | query | string | search term | required |

  ### Responses

     <details>
       <summary>  200 OK </summary>

       ```
           {
             data: {
                 id: String,
                 type: "merchant",
                 attributes: {
                     name: String
                 }
             }
         }
       ```
     </details>

     <details>
       <summary> 404 Not Found </summary>


       ```
        Error
       ```
     </details>

## Get All Items
  Get a list of all items in the database.

  GET http://localhost:3000/api/v1/items

  ### Responses

  <details>
    <summary>  200 OK </summary>

    ```
      {
        data: [
          {
              id: String,
              type: "item",
              attributes: {
                  name: String,
                  description: String,
                  unit_price: Float,
                  merchant_id: Integer
              }
          },
          {
              id: String,
              type: "item",
              attributes: {
                  name: String,
                  description: String,
                  unit_price: Float,
                  merchant_id: Integer
                }
          }
        ]
      }
    ```
  </details>

## Get Item Details
  Get the primary information about an item.

  GET http://localhost:3000/api/v1/items/{item_id}

  ### Path Parameters

  | param | data type | value | required/optional |
  |---|---|---|
  |  merchant_id | integer | valid resource id | required |


  ### Responses

     <details>
       <summary>  200 OK </summary>

        ```
          {
           data: {
             id: String,
             type: "item",
             attributes: {
                 name: String,
                 description: String,
                 unit_price: Float,
                 merchant_id: Integer
               }
          }
        }
      ```
     </details>

     <details>
       <summary> 404 Not Found </summary>


       ```
        Error
       ```
     </details>


## Create Item
  Create a new item record in the database.

  POST http://localhost:3000/api/v1/items

  ### Request Body Requirements
    Request body must contain all of these attributes for item record to be created.

  ```json
      {
    "name": String,
    "description": String,
    "unit_price": Float,
    "merchant_id": Integer
    }
  ```

  ### Responses

     <details>
       <summary>  201 Created </summary>

        ```
          {
           data: {
             id: String,
             type: "item",
             attributes: {
                 name: String,
                 description: String,
                 unit_price: Float,
                 merchant_id: Integer
               }
          }
        }
      ```
     </details>

## Delete Item
  Delete an item record from the database.

  DELETE http://localhost:3000/api/v1/items/{item_id}

  ### Path Parameters

  | param | data type | value | required/optional |
  |---|---|---|
  |  merchant_id | integer | valid resource id | required |

  ### Responses

    204 No Content


## Update Item
  Edit the primary information of an item in the database.

  PUT http://localhost:3000/api/v1/items/{item_id}

  ### Path Parameters

  | param | data type | value | required/optional |
  |---|---|---|
  |  merchant_id | integer | valid resource id | required |

  ### Request Body Options
    Request body may contain any or all of these attributes to update item information.
  ```json
      {
    "name": String,
    "description": String,
    "unit_price": Float,
    "merchant_id": Integer
    }
  ```

  ### Responses

     <details>
       <summary>  200 OK </summary>

        ```
          {
           data: {
             id: String,
             type: "item",
             attributes: {
                 name: String,
                 description: String,
                 unit_price: Float,
                 merchant_id: Integer
               }
          }
        }
      ```
     </details>

     <details>
       <summary> 404 Not Found </summary>


       ```
        Error
       ```
     </details>

## Search For Items
  Get a list of items matching the search term by name.

  GET http://localhost:3000/api/v1/items/find_all?name={query}

  ### Path Parameters

    | param | data type | value | required/optional |
    |---|---|---|
    | query | string | search term | required |

    ### Responses

    <details>
      <summary>  200 OK </summary>

      ```
        {
          data: [
            {
                id: String,
                type: "item",
                attributes: {
                    name: String,
                    description: String,
                    unit_price: Float,
                    merchant_id: Integer
                }
            },
            {
                id: String,
                type: "item",
                attributes: {
                    name: String,
                    description: String,
                    unit_price: Float,
                    merchant_id: Integer
                  }
            }
          ]
        }
      ```
    </details>

    
