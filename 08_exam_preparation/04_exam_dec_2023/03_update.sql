UPDATE products p
SET price = price * 1.1
FROM feedbacks fb
WHERE 
    p.id = fb.product_id 
AND 
    fb.rate > 8;
