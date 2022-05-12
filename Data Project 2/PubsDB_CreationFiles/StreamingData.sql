
-- Streaming Data (Mini Batches)

-- Mini Batch of sales orders
SELECT sales.ord_num, sales.ord_date, sales.qty, titles.title, titles.price, titles.royalty, (titles.price*sales.qty)  AS total_price
FROM sales
JOIN titles
ON sales.title_id = titles.title_id
WHERE sales.ord_date >= CONVERT(datetime, '1992-06-15 00:00:00.000') AND sales.ord_date <= CONVERT(datetime,'1993-05-24 00:00:00.000')
ORDER BY sales.ord_date

-- Mini Batch of sales orders
SELECT sales.ord_num, sales.ord_date, sales.qty, titles.title, titles.price, titles.royalty, (titles.price*sales.qty)  AS total_price
FROM sales
JOIN titles
ON sales.title_id = titles.title_id
WHERE sales.ord_date >= CONVERT(datetime, '1993-05-29 00:00:00.000') AND sales.ord_date <= CONVERT(datetime,'1994-09-13 00:00:00.000')
ORDER BY sales.ord_date

-- Mini Batch of sales orders
SELECT sales.ord_num, sales.ord_date, sales.qty, titles.title, titles.price, titles.royalty, (titles.price*sales.qty)  AS total_price
FROM sales
JOIN titles
ON sales.title_id = titles.title_id
WHERE sales.ord_date >= CONVERT(datetime, '1994-09-13 00:00:00.000') AND sales.ord_date <= CONVERT(datetime,'1994-09-14 00:00:00.000')
ORDER BY sales.ord_date



-- Specific Queries

-- Retrieve author name and title information
SELECT authors.au_fname
   , authors.au_lname
   , titles.title
   FROM authors
   INNER JOIN titleauthor
   ON authors.au_id = titleauthor.au_id
   INNER JOIN titles
   ON titleauthor.title_id = titles.title_id
   ORDER BY authors.au_lname

-- Retrieve total sales price, title, and royalty purchase order information
SELECT sales.ord_num, sales.qty, titles.title, titles.price, titles.royalty, (titles.price*sales.qty)  AS total_price
FROM sales
INNER JOIN titles
ON sales.title_id = titles.title_id


-- Retrieve publishers and titles data from Boston
SELECT publishers.city, publishers.pub_name, titles.title, titles.pubdate
FROM publishers
JOIN titles
ON publishers.pub_id = titles.pub_id
WHERE publishers.city like 'Boston'

-- Retrieve stores and employee data
SELECT stores.stor_name, stores.state, employee.fname, employee.lname, employee.job_lvl, employee.hire_date
FROM stores
JOIN sales
ON sales.stor_id = stores.stor_id
JOIN titles
ON sales.title_id = titles.title_id
JOIN employee
ON titles.pub_id = employee.pub_id