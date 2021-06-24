/*task1.e */

select p.Name as PropertyName, CONCAT(FirstName, ' ', LastName) as TenantName, pay.Amount as RentalRate, F.Name as PaymentFrequency
from dbo.OwnerProperty as OP
INNER JOIN dbo.PropertyRepayment as Pay on OP.PropertyId = pay.PropertyId
INNER JOIN dbo.Property as P on p.Id = pay.PropertyId
INNER JOIN dbo.TenantPaymentFrequencies as F on F.Id = Pay.FrequencyType
INNER JOIN dbo.TenantProperty as TP on TP.PropertyId = pay.PropertyId
INNER JOIN dbo.Person PE on PE.Id = TP.TenantId
Where OP.OwnerId = 1426

/*task1.e(redo)*/

select p.Name as PropertyName,
PE.FirstName AS TenantFirstName, 
PE.LastName as TenatLastName, 
pay.Amount as RentalRate, 
TP.PaymentAmount as RentalPaymentAmount,
F.Name as PaymentFrequency

from dbo.OwnerProperty as OP
INNER JOIN dbo.PropertyRepayment as Pay on OP.PropertyId = pay.PropertyId
INNER JOIN dbo.Property as P on p.Id = pay.PropertyId
INNER JOIN dbo.TenantPaymentFrequencies as F on F.Id = Pay.FrequencyType
INNER JOIN dbo.TenantProperty as TP on TP.PropertyId = pay.PropertyId
INNER JOIN dbo.Person PE on PE.Id = TP.TenantId
Where OP.OwnerId = 1426
