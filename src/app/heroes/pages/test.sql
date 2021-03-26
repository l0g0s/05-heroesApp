(
@P0 int,
@P1 varchar(8000),
@P2 varchar(8000),
@P3 int,
@P4 varchar(8000),
@P5 varchar(8000),
@P6 varchar(8000),
@P7 varchar(8000),
@P8 int
)
SELECT TOP (5) * FROM (
	SELECT * FROM (
		SELECT 
        /* ISNULL:pc_policycontactrole.ExpirationDate:, ISNULL:pc_policycontactrole.EffectiveDate:, pc:WebReq:AggregatorPolicySearch_AIT; +*/ 
    qRoot.ID col0,    account_1.AccountNumber col1,    qRoot.CancellationDate col2,    qRoot.PrimaryInsuredName col3,    qRoot.PolicyNumber col4,    qRoot.PeriodStart col5, 
    qRoot.PeriodEnd col6,    qRoot.EditEffectiveDate col7,    qRoot.BranchName col8,    qRoot.BranchNumber col9,    policyterm_2.PolicyTermArchiveState col10, 
    policy_0.ProductCode col11, qRoot.PeriodID col12, qRoot.ID col13, qRoot.ModelNumber col14, organization_4.Name col15, qRoot.JobID col16, 
    job_0.Subtype col17, qRoot.ProducerCodeOfRecordID col18, policy_0.ProducerCodeOfServiceID col19, qRoot.Status col20, qRoot.TermNumber col21 
    FROM pc_policyperiod qRoot 
    INNER JOIN pc_job AS job_0 ON job_0.ID=qRoot.JobID   
    INNER JOIN pc_policy AS policy_0 
    INNER JOIN pc_account AS account_1 ON account_1.ID=policy_0.AccountID   ON policy_0.ID=qRoot.PolicyID   
    INNER JOIN pc_policyterm AS policyterm_2 ON policyterm_2.ID=qRoot.PolicyTermID   
    INNER JOIN pc_producercode AS producercode_3 
    INNER JOIN pc_organization AS organization_4 ON organization_4.ID=producercode_3.OrganizationID   ON producercode_3.ID=qRoot.ProducerCodeOfRecordID   
    WHERE qRoot.ID IN (SELECT qRoot1.ForeignEntityID col0 
            FROM pc_jobpolicyperiod qRoot1 
            WHERE qRoot1.OwnerID IS NOT NULL
            ) 
        AND qRoot.PolicyID IN (
            SELECT qRoots2.PolicyID col0 
            FROM pc_policyperiod qRoots2 
            WHERE qRoots2.ID IN (
                    SELECT qRoots3.BranchID col0 
                    FROM pc_policycontactrole qRoots3 
                    WHERE qRoots3.Subtype = @P0 
                    AND qRoots3.ContactDenorm IN (
                            SELECT qRoots4.ID col0 
                            FROM pc_contact qRoots4 
                            WHERE qRoots4.FirstNameDenorm = @P1 COLLATE Latin1_General_CI_AS 
                            AND qRoots4.LastNameDenorm = @P2 COLLATE Latin1_General_CI_AS 
                            AND qRoots4.Retired = 0
                            ) 
                    AND ((qRoots3.EffectiveDate IS NULL) OR (qRoots3.ExpirationDate IS NULL) OR (qRoots3.EffectiveDate <> qRoots3.ExpirationDate))
                    ) 
            AND qRoots2.Retired = 0
            AND qRoots2.TemporaryBranch = 0
            ) 
        AND qRoot.Retired = 0         AND qRoot.TemporaryBranch = 0 
        AND job_0.Subtype = 7         AND job_0.Retired = 0 
        AND account_1.Retired = 0     AND policy_0.Retired = 0 
        AND policyterm_2.Retired = 0  AND organization_4.Retired = 0 AND producercode_3.Retired = 0 
        UNION 
        SELECT /*+ ISNULL:pc_policycontactrole.ExpirationDate:, ISNULL:pc_policycontactrole.EffectiveDate:, pc:WebReq:AggregatorPolicySearch_AIT; +*/ 
        qRoot.ID col0, account_1.AccountNumber col1, qRoot.CancellationDate col2, qRoot.PrimaryInsuredName col3, qRoot.PolicyNumber col4, qRoot.PeriodStart col5, 
        qRoot.PeriodEnd col6, qRoot.EditEffectiveDate col7, qRoot.BranchName col8, qRoot.BranchNumber col9, policyterm_2.PolicyTermArchiveState col10, 
        policy_0.ProductCode col11, qRoot.PeriodID col12, qRoot.ID col13, qRoot.ModelNumber col14, organization_4.Name col15, qRoot.JobID col16, job_0.Subtype col17, 
        qRoot.ProducerCodeOfRecordID col18, policy_0.ProducerCodeOfServiceID col19, qRoot.Status col20, qRoot.TermNumber col21 
        FROM pc_policyperiod qRoot 
        INNER JOIN pc_job AS job_0 ON job_0.ID=qRoot.JobID   
        INNER JOIN pc_policy AS policy_0 INNER JOIN pc_account AS account_1 ON account_1.ID=policy_0.AccountID   ON policy_0.ID=qRoot.PolicyID   INNER JOIN pc_policyterm AS policyterm_2 ON policyterm_2.ID=qRoot.PolicyTermID   
        INNER JOIN pc_producercode AS producercode_3 
        INNER JOIN pc_organization AS organization_4 ON organization_4.ID=producercode_3.OrganizationID   ON producercode_3.ID=qRoot.ProducerCodeOfRecordID   
        WHERE qRoot.ID IN (SELECT qRoot1.ForeignEntityID col0 
                FROM pc_jobpolicyperiod qRoot1 
                WHERE qRoot1.OwnerID IS NOT NULL
                ) 
        AND qRoot.PolicyID IN (SELECT qRoots2.PolicyID col0 
                FROM pc_policyperiod qRoots2 
                WHERE qRoots2.ID IN (
                        SELECT qRoots3.BranchID col0 
                        FROM pc_policycontactrole qRoots3 
                        WHERE qRoots3.Subtype = @P3 
                        AND qRoots3.FirstNameInternalDenorm = @P4 COLLATE Latin1_General_CI_AS 
                        AND qRoots3.LastNameInternalDenorm = @P5 COLLATE Latin1_General_CI_AS 
                        AND ((qRoots3.EffectiveDate IS NULL) OR (qRoots3.ExpirationDate IS NULL) OR (qRoots3.EffectiveDate <> qRoots3.ExpirationDate))
                        ) 
                AND qRoots2.Retired = 0 AND qRoots2.TemporaryBranch = 0
                ) 
        AND qRoot.Retired = 0 
        AND qRoot.TemporaryBranch = 0 
        AND job_0.Subtype = 7 
        AND job_0.Retired = 0 
        AND account_1.Retired = 0 
        AND policy_0.Retired = 0 
        AND policyterm_2.Retired = 0 
        AND organization_4.Retired = 0 
        AND producercode_3.Retired = 0
        ) a 
        INTERSECT 
        SELECT /* pc:WebReq:AggregatorPolicySearch_AIT; */ 
        qRoot.ID col0, account_1.AccountNumber col1, qRoot.CancellationDate col2, qRoot.PrimaryInsuredName col3, qRoot.PolicyNumber col4, qRoot.PeriodStart col5, 
        qRoot.PeriodEnd col6, qRoot.EditEffectiveDate col7, qRoot.BranchName col8, qRoot.BranchNumber col9, policyterm_2.PolicyTermArchiveState col10, 
        policy_0.ProductCode col11, qRoot.PeriodID col12, qRoot.ID col13, qRoot.ModelNumber col14, organization_4.Name col15, qRoot.JobID col16, 
        job_5.Subtype col17, qRoot.ProducerCodeOfRecordID col18, policy_0.ProducerCodeOfServiceID col19, qRoot.Status col20, qRoot.TermNumber col21 
        FROM pc_policyperiod qRoot 
        INNER JOIN pc_policy AS policy_0 
        INNER JOIN pc_account AS account_1 ON account_1.ID=policy_0.AccountID   ON policy_0.ID=qRoot.PolicyID   
        INNER JOIN pc_policyterm AS policyterm_2 ON policyterm_2.ID=qRoot.PolicyTermID   
        INNER JOIN pc_producercode AS producercode_3 
        INNER JOIN pc_organization AS organization_4 ON organization_4.ID=producercode_3.OrganizationID   ON producercode_3.ID=qRoot.ProducerCodeOfRecordID   
        LEFT OUTER JOIN pc_job AS job_5 ON job_5.ID=qRoot.JobID  AND job_5.Retired = 0  
        WHERE qRoot.ID IN (
                SELECT gRoot.BranchID col0 
                FROM pc_policycontactrole gRoot 
                WHERE gRoot.FirstNameInternal = @P6 
                AND gRoot.LastNameInternal = @P7 
                AND gRoot.Subtype = @P8
                ) 
        AND qRoot.Retired = 0 
        AND qRoot.TemporaryBranch = 0 
        AND account_1.Retired = 0 
        AND policy_0.Retired = 0 
        AND policyterm_2.Retired = 0 
        AND organization_4.Retired = 0 
        AND producercode_3.Retired = 0
        ) a 
ORDER BY col0 ASC


