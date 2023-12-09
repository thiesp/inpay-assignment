Customers::Customer.where(id: 1).first_or_create(name: "Thies", date_of_birth: "1970-01-01".to_date, place_of_birth: "Denmark")
Customers::Customer.where(id: 2).first_or_create(name: "Peter", date_of_birth: "1942-01-01".to_date, place_of_birth: "Germany")

Payments::Payment.where(id: 1).first_or_create(amount: 42.1, currency: "DKK", timestamp: "2022-12-24 12:34".to_time, customer_id: 1)
Payments::Payment.where(id: 2).first_or_create(amount: 23.1, currency: "EUR", timestamp: "2022-12-24 12:35".to_time, customer_id: 1)
Payments::Payment.where(id: 3).first_or_create(amount: 123, currency: "EUR", timestamp: "2023-11-24 12:34".to_time, customer_id: 2)

