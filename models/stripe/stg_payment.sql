select 
ID as payment_id,
"orderID" as order_id,
"paymentMethod" as payment_method,
amount,
created as created_at
from raw.stripe.payment