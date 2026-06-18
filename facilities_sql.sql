-- ============================================================
-- FACILITIES MAINTENANCE DASHBOARD — SQL PROJECT
-- Author: Yadvinder Punj
-- Dataset: Fictional work order data (RCSI-style, 2024)
-- Tool: SQLite (paste into https://dbfiddle.uk — select SQLite)
-- ============================================================


-- ============================================================
-- STEP 1: CREATE TABLE
-- ============================================================

CREATE TABLE work_orders (
    job_id        TEXT,
    date_logged   TEXT,
    category      TEXT,
    description   TEXT,
    priority      TEXT,
    status        TEXT,
    contractor    TEXT,
    days_to_close INTEGER,
    cost_eur      REAL,
    building      TEXT
);


-- ============================================================
-- STEP 2: INSERT SAMPLE DATA (50 rows — representative sample)
-- ============================================================

INSERT INTO work_orders VALUES
('WO-1001','2024-01-03','Electrical','Faulty lighting in corridor','High','Completed','Murphy Maintenance',4,320.00,'Main Campus'),
('WO-1002','2024-01-07','Plumbing','Leaking tap in kitchen','Medium','Completed','Murphy Maintenance',3,150.00,'Admin Block'),
('WO-1003','2024-01-10','HVAC','AC unit not cooling','High','Completed','CoolAir Services',7,980.00,'Research Block'),
('WO-1004','2024-01-14','Lift','Annual lift inspection','Medium','Completed','Lift Tech Ireland',5,620.00,'Main Campus'),
('WO-1005','2024-01-18','Cleaning','Deep clean after event','Low','Completed','ProClean',2,200.00,'Student Centre'),
('WO-1006','2024-01-21','Fire Safety','Smoke detector test','High','Completed','BuildRight Ltd',3,410.00,'Library'),
('WO-1007','2024-01-25','IT Equipment','Projector bulb replacement','Low','Completed','TechFix Dublin',1,95.00,'Library'),
('WO-1008','2024-02-02','Structural','Ceiling tile replacement','Medium','Completed','BuildRight Ltd',6,540.00,'Admin Block'),
('WO-1009','2024-02-06','Electrical','Power socket not working','Medium','Completed','Murphy Maintenance',3,180.00,'Student Centre'),
('WO-1010','2024-02-09','HVAC','Ventilation filter replacement','Low','Completed','CoolAir Services',2,310.00,'Main Campus'),
('WO-1011','2024-02-13','Plumbing','Blocked drain','High','Completed','Murphy Maintenance',2,275.00,'Research Block'),
('WO-1012','2024-02-17','IT Equipment','Network switch fault','High','Completed','TechFix Dublin',4,860.00,'Main Campus'),
('WO-1013','2024-02-22','Fire Safety','Fire extinguisher inspection','Medium','Completed','BuildRight Ltd',2,390.00,'Admin Block'),
('WO-1014','2024-03-01','HVAC','Heating system fault','High','Completed','CoolAir Services',8,1250.00,'Library'),
('WO-1015','2024-03-05','Cleaning','Window cleaning','Low','Completed','ProClean',1,180.00,'Main Campus'),
('WO-1016','2024-03-08','Electrical','Emergency lighting test','Medium','Completed','Murphy Maintenance',4,290.00,'Research Block'),
('WO-1017','2024-03-12','Lift','Lift door sensor fault','High','Completed','Lift Tech Ireland',6,740.00,'Student Centre'),
('WO-1018','2024-03-16','Structural','Door hinge repair','Low','Completed','BuildRight Ltd',3,120.00,'Admin Block'),
('WO-1019','2024-03-20','Plumbing','Water pressure issue','Medium','Completed','Murphy Maintenance',5,340.00,'Main Campus'),
('WO-1020','2024-03-25','IT Equipment','Monitor replacement','Low','Completed','TechFix Dublin',2,480.00,'Library'),
('WO-1021','2024-04-03','HVAC','Boiler service','Medium','Completed','CoolAir Services',3,920.00,'Main Campus'),
('WO-1022','2024-04-07','Electrical','Panel board inspection','High','Completed','Murphy Maintenance',5,650.00,'Admin Block'),
('WO-1023','2024-04-10','Fire Safety','Emergency exit sign repair','Medium','Completed','BuildRight Ltd',4,210.00,'Student Centre'),
('WO-1024','2024-04-14','Cleaning','Carpet cleaning','Low','Completed','ProClean',2,260.00,'Research Block'),
('WO-1025','2024-04-18','Structural','Window seal replacement','Medium','Completed','BuildRight Ltd',7,390.00,'Library'),
('WO-1026','2024-05-02','Lift','Emergency stop test','High','Completed','Lift Tech Ireland',3,580.00,'Main Campus'),
('WO-1027','2024-05-06','Plumbing','Toilet flush repair','Low','Completed','Murphy Maintenance',2,130.00,'Student Centre'),
('WO-1028','2024-05-10','IT Equipment','Printer offline','Medium','Completed','TechFix Dublin',2,150.00,'Admin Block'),
('WO-1029','2024-05-14','HVAC','AC unit not cooling','High','Completed','CoolAir Services',9,1450.00,'Research Block'),
('WO-1030','2024-05-19','Electrical','Faulty lighting in corridor','Medium','Completed','Murphy Maintenance',3,300.00,'Library'),
('WO-1031','2024-06-04','Fire Safety','Sprinkler check','High','Completed','BuildRight Ltd',5,870.00,'Main Campus'),
('WO-1032','2024-06-08','Structural','Flooring repair','Medium','Completed','BuildRight Ltd',10,1100.00,'Admin Block'),
('WO-1033','2024-06-12','Cleaning','Pressure wash carpark','Low','Completed','ProClean',1,320.00,'Main Campus'),
('WO-1034','2024-06-17','HVAC','Ventilation filter replacement','Medium','Completed','CoolAir Services',3,290.00,'Student Centre'),
('WO-1035','2024-06-21','IT Equipment','Network switch fault','High','Completed','TechFix Dublin',5,920.00,'Research Block'),
('WO-1036','2024-07-03','Electrical','Power socket not working','Low','Completed','Murphy Maintenance',2,160.00,'Admin Block'),
('WO-1037','2024-07-08','Plumbing','Leaking tap in kitchen','Medium','Completed','Murphy Maintenance',4,175.00,'Library'),
('WO-1038','2024-07-12','Lift','Lift button replacement','Low','Completed','Lift Tech Ireland',2,310.00,'Main Campus'),
('WO-1039','2024-07-17','HVAC','Heating system fault','High','Completed','CoolAir Services',11,1680.00,'Research Block'),
('WO-1040','2024-07-22','Fire Safety','Smoke detector test','Medium','Completed','BuildRight Ltd',3,400.00,'Student Centre'),
('WO-1041','2024-08-05','Structural','Ceiling tile replacement','Low','Completed','BuildRight Ltd',4,490.00,'Library'),
('WO-1042','2024-08-09','IT Equipment','Projector bulb replacement','Low','Completed','TechFix Dublin',1,90.00,'Admin Block'),
('WO-1043','2024-08-14','Electrical','Emergency lighting test','High','Completed','Murphy Maintenance',4,340.00,'Main Campus'),
('WO-1044','2024-08-19','Plumbing','Blocked drain','Medium','Completed','Murphy Maintenance',3,250.00,'Student Centre'),
('WO-1045','2024-09-03','HVAC','AC unit not cooling','High','In Progress',NULL,NULL,NULL,'Main Campus'),
('WO-1046','2024-09-07','Electrical','Panel board inspection','Medium','Completed','Murphy Maintenance',6,720.00,'Research Block'),
('WO-1047','2024-10-10','Fire Safety','Fire extinguisher inspection','High','Pending',NULL,NULL,NULL,'Library'),
('WO-1048','2024-11-05','Lift','Annual lift inspection','Medium','Completed','Lift Tech Ireland',4,640.00,'Admin Block'),
('WO-1049','2024-11-12','Structural','Door hinge repair','Low','In Progress',NULL,NULL,NULL,'Student Centre'),
('WO-1050','2024-12-03','Cleaning','Deep clean after event','Low','Completed','ProClean',2,195.00,'Main Campus');


-- ============================================================
-- QUERY 1: Total work orders by category
-- What it shows: Which maintenance type is most common?
-- ============================================================

SELECT
    category,
    COUNT(*) AS total_jobs,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM work_orders), 1) AS pct_of_total
FROM work_orders
GROUP BY category
ORDER BY total_jobs DESC;


-- ============================================================
-- QUERY 2: Completion rate and average resolution time by priority
-- What it shows: Are high-priority jobs being closed faster?
-- ============================================================

SELECT
    priority,
    COUNT(*) AS total_jobs,
    SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS completed,
    ROUND(
        SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1
    ) AS completion_rate_pct,
    ROUND(AVG(CASE WHEN status = 'Completed' THEN days_to_close END), 1) AS avg_days_to_close
FROM work_orders
GROUP BY priority
ORDER BY CASE priority
    WHEN 'High'   THEN 1
    WHEN 'Medium' THEN 2
    ELSE 3
END;


-- ============================================================
-- QUERY 3: Monthly trend — volume and spend
-- What it shows: Which months are busiest and most expensive?
-- ============================================================

SELECT
    SUBSTR(date_logged, 1, 7)             AS month,
    COUNT(*)                              AS jobs_logged,
    SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS completed,
    ROUND(SUM(COALESCE(cost_eur, 0)), 2) AS total_cost_eur
FROM work_orders
GROUP BY month
ORDER BY month;


-- ============================================================
-- QUERY 4: Top 3 most costly maintenance categories
-- What it shows: Where is the most money being spent?
-- ============================================================

SELECT
    category,
    COUNT(*)                              AS completed_jobs,
    ROUND(SUM(cost_eur), 2)              AS total_cost_eur,
    ROUND(AVG(cost_eur), 2)              AS avg_cost_per_job,
    MAX(cost_eur)                         AS highest_single_job
FROM work_orders
WHERE status = 'Completed'
GROUP BY category
ORDER BY total_cost_eur DESC
LIMIT 3;


-- ============================================================
-- QUERY 5: Contractor performance comparison
-- What it shows: Which contractors are fastest and most used?
-- ============================================================

SELECT
    contractor,
    COUNT(*)                                                     AS total_jobs,
    ROUND(AVG(days_to_close), 1)                                AS avg_days_to_close,
    ROUND(AVG(cost_eur), 2)                                     AS avg_cost_eur,
    ROUND(SUM(cost_eur), 2)                                     AS total_spend_eur
FROM work_orders
WHERE status = 'Completed'
GROUP BY contractor
ORDER BY total_jobs DESC;


-- ============================================================
-- QUERY 6: Buildings with most outstanding (open) jobs
-- What it shows: Which buildings need the most attention right now?
-- ============================================================

SELECT
    building,
    COUNT(*) AS open_jobs,
    SUM(CASE WHEN priority = 'High' THEN 1 ELSE 0 END) AS high_priority_open
FROM work_orders
WHERE status IN ('Pending', 'In Progress')
GROUP BY building
ORDER BY open_jobs DESC;


-- ============================================================
-- QUERY 7: Jobs taking longer than average to close (SLA breach)
-- What it shows: Which jobs breached the average resolution time?
-- ============================================================

SELECT
    job_id,
    date_logged,
    category,
    priority,
    contractor,
    days_to_close,
    ROUND((SELECT AVG(days_to_close) FROM work_orders WHERE status = 'Completed'), 1) AS avg_days,
    days_to_close - ROUND((SELECT AVG(days_to_close) FROM work_orders WHERE status = 'Completed'), 1) AS days_over_avg
FROM work_orders
WHERE status = 'Completed'
  AND days_to_close > (SELECT AVG(days_to_close) FROM work_orders WHERE status = 'Completed')
ORDER BY days_to_close DESC;
