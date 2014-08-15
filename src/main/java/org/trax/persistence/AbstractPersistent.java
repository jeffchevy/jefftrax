/** Copyright 2012 3M Health Information Systems, Inc.


 Licensed under the Apache License, Version 2.0 (the “License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an “AS IS" BASIS, WITHOUT
 WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 License for the specific language governing permissions and limitations
 under the License.
*/
package org.trax.persistence;

import java.io.Serializable;

import javax.persistence.MappedSuperclass;

import org.hibernate.Hibernate;

//@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE, getterVisibility = JsonAutoDetect.Visibility.NONE)
@MappedSuperclass
public abstract class AbstractPersistent<T> implements Serializable
{
    private static final long serialVersionUID = 1L;
    
    /**
     * @see java.lang.Object#equals(Object)
     */
    @SuppressWarnings("unchecked")
    @Override
    public final boolean equals(Object o)
    {
        if (this == o)
        {
            return true;
        }
        // prevents polymorphic comparisons
        if (o == null || !Hibernate.getClass(o).equals(Hibernate.getClass(this)))
        {
            return false;
        }
        T oo = (T) o;

        return requiredEquals(oo);
    }

    protected abstract boolean requiredEquals(T oo);

    /**
     * @see java.lang.Object#hashCode()
     */
    @Override
    public final int hashCode()
    {
        return requiredHashCode();
    }

    protected abstract int requiredHashCode();
}