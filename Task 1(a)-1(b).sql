/*task1.a*/

select p.Name as propertyname, t.PropertyId,t.OwnerId
from dbo.Property p join dbo.OwnerProperty t on p.Id = t.Id
where t.OwnerId = 1426
group by p.Name, t.OwnerId, t.PropertyId

/*task1.a(redo)*/

select Property.Name, OwnerProperty.PropertyId
from dbo.Property inner join dbo.OwnerProperty on Property.Id = OwnerProperty.PropertyId
where OwnerProperty.OwnerId = 1426


/*task1.b*/

SELECT Property.Name, Property.Id, PropertyHomeValue.Value,OwnerProperty.OwnerId AS Owner_ID
FROM Property
INNER JOIN OwnerProperty
ON Property.Id = OwnerProperty.PropertyId
INNER JOIN PropertyHomeValue
ON Property.Id = PropertyHomeValue.PropertyId
WHERE OwnerProperty.OwnerId = '1426'

/*task1.b(redo)*/

select Property.Name, OwnerProperty.PropertyId, PropertyFinance.CurrentHomeValue
from dbo.Property INNER JOIN dbo.OwnerProperty on Property.Id = OwnerProperty.PropertyId
INNER JOIN dbo.PropertyFinance on Property.Id = PropertyFinance.PropertyId
where OwnerProperty.OwnerId = 1426
