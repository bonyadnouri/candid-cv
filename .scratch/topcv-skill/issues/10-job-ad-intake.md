# How does a job ad get in, and how do we tell employer from agency?

Type: grilling
Status: open
Blocked by: —

## Question

Everything downstream keys off the job ad. Settle how it arrives and what gets extracted.

### Intake

- Pasted text, a URL, a file, or all three? A URL means fetching — and LinkedIn, Indeed, and StepStone all block or paywall scraping, so a URL-first design may fail on exactly the sites people use most.
- What if the ad is a screenshot?
- What's the minimum viable input? Can the skill work from a job *title* plus company alone, if that's all the user has?

### Extraction

What structured facts come out: employer, role title, seniority, location, work model, must-haves vs nice-to-haves, the vocabulary the ad uses, the target market (which selects the conventions table from *What CV conventions differ by market and role family?*).

### The agency problem

The user flagged this specifically: an ad posted by a staffing agency or recruiter names the *agency*, not the employer — and researching the agency produces confidently wrong context that then poisons the CV.

- What signals separate a direct posting from an agency one? (agency boilerplate, "our client", no named employer, generic role titles, recruiter contact, agency domain in the apply link.)
- Once detected, what changes? Company research must clearly not run against the agency. Is the employer sometimes inferrable from the ad's details — and is guessing worse than admitting ignorance?
- **What does the skill do when the employer is genuinely unknown?** Proceed with role-level tailoring only and say so? Ask the user? This is the honest answer to a common case, and it needs deciding rather than defaulting.

### Confidence

Should the skill state what it believes about the employer and let the user correct it before research burns tokens on the wrong company? Cheap insurance against a confidently wrong CV.

## What the answer must produce

The accepted input forms, the extracted job-ad schema, the agency-detection heuristics, and the defined behaviour when the employer can't be established.
