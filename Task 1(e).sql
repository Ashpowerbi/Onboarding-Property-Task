/*task1.e */

SELECT Property.Name, Person.FirstName, Person.LastName, TargetRentType.Name
FROM Property 
INNER JOIN OwnerProperty ---Join between Property AND OwnerProperty
ON Property.Id = OwnerProperty.PropertyId
INNER JOIN PropertyRentalPayment prp --- Join between Property AND PropertyRentalPayment
ON Property.id = prp.PropertyId
INNER JOIN TargetRentType --- Join between Property AND TargetRentType
ON Property.TargetRentTypeId = TargetRentType.Id
INNER JOIN Person
ON OwnerProperty.OwnerId = Person.Id
INNER JOIN Tenant
ON Person.Id = Tenant.Id
WHERE OwnerProperty.OwnerId = '1426'