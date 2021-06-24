/*task1.c.i*/


select PropertyHomeValue.PropertyId,
Property.Name as PropertyName, 
TenantProperty.PaymentAmount, 
TenantPaymentFrequencies.Code as PaymentFrequency,
TenantProperty.StartDate,
TenantProperty.EndDate,

CASE WHEN TenantProperty.PaymentFrequencyId = 1 THEN (DATEDIFF(WEEK,TenantProperty.StartDate, TenantProperty.EndDate) * Tenantproperty.PaymentAmount)
WHEN TenantProperty.PaymentFrequencyId = 2 THEN ((DATEDIFF(WEEK, TenantProperty.StartDate, TenantProperty.EndDate)/2) * TenantProperty.PaymentAmount)
WHEN TenantProperty.PaymentFrequencyId = 3 THEN (DATEDIFF(MONTH, TenantProperty.StartDate, TenantProperty.EndDate) * TenantProperty.PaymentAmount)
ELSE 0
END AS TotalPayment

from PropertyHomeValue
INNER JOIN OwnerProperty on dbo.OwnerProperty.PropertyId = PropertyHomeValue.PropertyId
INNER JOIN dbo.Property ON dbo.OwnerProperty.PropertyId = Property.Id
INNER JOIN dbo.TenantProperty ON dbo.OwnerProperty.PropertyId = dbo.TenantProperty.PropertyId
INNER JOIN dbo.TenantPaymentFrequencies ON dbo.TenantProperty.PaymentFrequencyId = dbo.TenantPaymentFrequencies.Id
where PropertyHomeValue.PropertyId IN (Select Property.Id as PropertyId
from dbo.Property
INNER JOIN dbo.OwnerProperty ON dbo.OwnerProperty.PropertyId = Property.Id
where OwnerProperty.OwnerId = 1426) AND PropertyHomeValue.IsActive = 1;

/*task1.c.ii*/

select pf.Yield, op.PropertyId from dbo.PropertyFinance pf
join dbo.OwnerProperty op on pf.PropertyId = op.PropertyId
where op.OwnerId = 1426;
