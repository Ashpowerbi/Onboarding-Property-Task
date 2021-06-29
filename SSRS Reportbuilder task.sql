SELECT Property.Name AS PropertyName,
CONCAT(Person.FirstName, ' ' ,Person.LastName) as CurrentOwner, 
OwnerProperty.OwnerId, 
Person.Id AS PersonId,
CONCAT(Address.Number, ' ' , Address.Street + ' ' + Address.Suburb + ' ' + Address.City + Address.Region + Address.PostCode) as PropertyAddress,
CONCAT(Property.Bedroom, ' ', 'Bedrooms', ', ' , Property.Bathroom, ' ', 'Bathrooms') as PropertyDetails,
prp.Amount AS Property_Payment,
LOWER(LEFT(TargetRentType.Name,4)) as RentalFrequencies,
PropertyExpense.Description AS Expense_Description,
PropertyExpense.Amount AS Expense_Amount,
FORMAT(PropertyExpense.Date, 'dd MMM yyyy') AS Expense_Date

FROM  Property

INNER JOIN OwnerProperty
 ON Property.Id = OwnerProperty.PropertyId
INNER JOIN Person
 ON OwnerProperty.OwnerId = Person.Id
INNER JOIN Address
 ON Property.AddressId = Address.AddressId
INNER JOIN PropertyRentalPayment prp
ON Property.id = prp.PropertyId
INNER JOIN TargetRentType
ON prp.FrequencyType = TargetRentType.id
INNER JOIN PropertyExpense
ON Property.id = PropertyExpense.PropertyId
where Property.Name = 'Property A'