/*task1.d*/
SELECT Job.Id AS Job_ID, Job.JobDescription ,JobStatus.Status
FROM Job
INNER JOIN JobStatus
ON Job.JobStatusId = JobStatus.Id
WHERE JobStatus.Status = 'Open'

/*task1.d*(redo)/

select JobMedia.JobId,
JobMedia.PropertyId,
Job.OwnerId,
Job.JobDescription,
COUNT(JobStatusId) as NumberofJobMedia
from JobMedia INNER JOIN Job on Job.Id = JobMedia.PropertyId
where JobMedia.IsActive = 1
GROUP BY JobMedia.JobId,
JobMedia.PropertyId,
Job.OwnerId,
Job.JobDescription
