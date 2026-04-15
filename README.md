# CSE311L-Section-6-Group-7-Project
For our DBMS project, we have implemented a Dengue Tracking System which is a fully functional relational database schema specifically designed for multi-hospital dengue surveillance. 
By populating data into a common DBMS, Doctors can easily access a patient's platelet records and their treatment history. Lack of a  unified database leads to delayed treatments, redundant lab tests and a complete 'Blind Spot' for public health officials monitoring national bed capacity. By consolidating data in a common database, doctors can keep track of the patient's platelet records. While Nurses and Data Entry Staff follow a standardized protocol for monitoring vitals. 
Users include Doctors and Nurses. 
The DBMS uses mandatory national ID to link records across all clinics and hospitals. 
It eliminates the scope for double counting patients and ensures a single continuous medical history even if the  patient is referred to multiple by facilities. 
It categorizes cases by Dengue types (Classic vs. Hemorrhagic) and severity levels (Mid to critical, allowing doctors to prioritize high-risk patients and analyze outcome trends (Recovered vs. Died). 
Keeps track of the blood type and platelet count data, which can be used to identify patients in urgent need of transfusions and matches them with hospital resources or potential donor pools. 
The DBMS keeps track of Patients as well as Donors, and enables both entities to use the same addresses table so that Hospitals can locate nearby Donors in urgent need of transfusions.
The DBMS uses ENUMs wherever applicable instead of VARCHAR to ensure standardized entry of data across different hospitals. 
