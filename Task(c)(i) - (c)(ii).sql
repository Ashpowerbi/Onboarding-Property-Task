/*task1.c.i*/
SELECT Property.Id AS Property_ID,prp.Amount, 
	   prp.FrequencyType,
	   TargetRentType.Name AS Payment_Intervals,
	   TenantProperty.StartDate,
	   TenantProperty.EndDate,
	   (CASE
		 WHEN TargetRentType.Name = 'Fortnightly' THEN (DATEDIFF(Week, TenantProperty.StartDate, TenantProperty.EndDate)/2) * prp.Amount
		 WHEN TargetRentType.Name = 'Weekly' THEN DATEDIFF(Week, TenantProperty.StartDate, TenantProperty.EndDate) * prp.Amount
		 WHEN TargetRentType.Name = 'Monthly' THEN DATEDIFF(month, TenantProperty.StartDate, TenantProperty.EndDate) * prp.Amount
		 ELSE ''
	   END) AS Sum_Amount
FROM Property
	   INNER JOIN OwnerProperty ---Join between Property AND OwnerProperty
	   ON Property.Id = OwnerProperty.PropertyId
	   INNER JOIN PropertyRentalPayment prp --- Join between Property AND PropertyRentalPayment
	   ON Property.id = prp.PropertyId
	   INNER JOIN TargetRentType --- Join between Property AND TargetRentType
	   ON Property.TargetRentTypeId = TargetRentType.Id
       INNER JOIN TenantProperty --- Join between Property AND TenantProperty
									 /*Caution: there is no relationship between two tables
									   though each record shows a strong relationship*/
	   ON Property.Id = TenantProperty.PropertyId
WHERE OwnerProperty.OwnerId = '1426'

/*task1.c.ii*/

select pf.Yield, op.PropertyId from dbo.PropertyFinance pf
join dbo.OwnerProperty op on pf.PropertyId = op.PropertyId
where op.OwnerId = 1426;