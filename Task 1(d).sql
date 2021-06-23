/*task1.d*/
SELECT Job.Id AS Job_ID, Job.JobDescription ,JobStatus.Status
FROM Job
INNER JOIN JobStatus
ON Job.JobStatusId = JobStatus.Id
WHERE JobStatus.Status = 'Open'