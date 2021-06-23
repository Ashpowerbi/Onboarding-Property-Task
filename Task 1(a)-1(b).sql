/*task1.a*/

select p.Name as propertyname, t.PropertyId,t.OwnerId
from dbo.Property p join dbo.OwnerProperty t on p.Id = t.Id
where t.OwnerId = 1426
group by p.Name, t.OwnerId, t.PropertyId

/*task1.b*/

SELECT Property.Name, Property.Id, PropertyHomeValue.Value,OwnerProperty.OwnerId AS Owner_ID
FROM Property
INNER JOIN OwnerProperty
ON Property.Id = OwnerProperty.PropertyId
INNER JOIN PropertyHomeValue
ON Property.Id = PropertyHomeValue.PropertyId
WHERE OwnerProperty.OwnerId = '1426'