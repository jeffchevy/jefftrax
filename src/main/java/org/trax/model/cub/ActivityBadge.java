package org.trax.model.cub;

import java.util.Date;
import java.util.Set;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import org.trax.model.Award;
import org.trax.model.AwardConfig;
import org.trax.model.Requirement;
import org.trax.model.User;

@SuppressWarnings("serial")
@Entity
@DiscriminatorValue("G")
public class ActivityBadge extends Award
{
	public ActivityBadge()
	{
	}
	
	public ActivityBadge(AwardConfig awardConfig, Date dateCompleted, String reminders, Set<Requirement> requirements, User signOffLeader)
	{
		super(awardConfig, dateCompleted, reminders, requirements, signOffLeader);
	}
}
