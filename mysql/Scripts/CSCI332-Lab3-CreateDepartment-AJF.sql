USE cofc2ajf;

CREATE TABLE DEPARTMENT
(
	DID		CHAR(4),
    DeptName	VARCHAR(30) NOT NULL,
    OfficeLocation	VARCHAR(255),
    CharID	CHAR(8),
    
    PRIMARY KEY (DID)
);