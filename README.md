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
  200 Schema Example 
  ```object 
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
  
## Get Merchant Details 
  Get the primary information about a merchant. 
  
  GET http://localhost:3000/api/v1/merchants/{merchant_id}

### Path Parameters 

 | param | data type | required/optional |
 |---|---|---|
 | merchant_id | integer | required | 

### Responses 

  200 Schema Example 
  
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
404 Not Found

```
 Error 
```

## Get Merchant Items 

  Get all items that belong to a merchant.
  
  GET http://localhost:3000/api/v1/merchants/{merchant_id}/items
  
### Path Parameters 
  
   | param | data type | required/optional |
 |---|---|---|
 | merchant_id | integer | required | 

### Responses 
  200 Schema Example 
  
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

  404 Not Found

  ```
  Error 
  ```



  
        

  
