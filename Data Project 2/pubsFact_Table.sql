
CREATE TABLE fact_table (
    au_id  char(11) DEFAULT NULL,
    title_id  char(6)           NOT NULL,
    pub_id  char(4)        NOT NULL,
    price smallint          NOT NULL,
    stor_id smallint          NOT NULL,
    qty  smallint          NOT NULL,
    job_id smallint          NOT NULL,
    emp_id char(9)           NOT NULL,
)

INSERT fact_table (
    au_id,
    title_id,
    pub_id,
    price,
    stor_id,
    qty,
    job_id,
    emp_id
)
    SELECT authors.au_id
        , titles.title_id
        , titles.pub_id
        , titles.price
        , sales.stor_id
        , sales.qty
        , employee.job_id
        , employee.emp_id
    FROM authors
    INNER JOIN titleauthor
    ON authors.au_id = titleauthor.au_id
    INNER JOIN titles
    ON titleauthor.title_id = titles.title_id
    RIGHT JOIN sales
    ON titles.title_id = sales.title_id
    JOIN employee
    ON titles.pub_id = employee.pub_id 

