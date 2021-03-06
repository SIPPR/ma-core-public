/**
 * Copyright (C) 2016 Infinite Automation Software. All rights reserved.
 * @author Terry Packer
 */
package com.serotonin.m2m2.module;

import com.serotonin.m2m2.vo.event.detector.AbstractEventDetectorVO;
import com.serotonin.m2m2.vo.permission.PermissionHolder;
import com.serotonin.m2m2.web.mvc.rest.v1.model.events.detectors.AbstractEventDetectorModel;

/**
 * Provides modules with the ability to register additional event detectors
 * 
 * @author Terry Packer
 *
 */
public abstract class EventDetectorDefinition<T extends AbstractEventDetectorVO<T>> extends ModuleElementDefinition{

	/**
	 * Name of the column in the event detectors into which to store the source id
	 * @return
	 */
	abstract public String getSourceIdColumnName();
	
	/**
	 * Name of the type of Source [DATA_POINT, DATA_SOURCE, SYSTEM, ...]
	 * used to group detectors by source of event
	 * 
	 * @return
	 */
	abstract public String getSourceTypeName();
	
    /**
     * An internal identifier for this type of Event Detector. Must be unique within an MA instance, and is recommended
     * to have the form "&lt;moduleType&gt;.&lt;modelName&gt;" so as to be unique across all modules.
     * 
     * @return the model type name.
     */
    abstract public String getEventDetectorTypeName();
    	
    /**
     * A reference to a human readable and translatable brief description of the handler. Key reference values in
     * i18n.properties files. Descriptions are used in drop down select boxes, and so should be as brief as possible.
     * 
     * @return the reference key to the handler's short description.
     */
    abstract public String getDescriptionKey();
    
    /**
     * Create and return an instance of the event detector with its source id for use to look up 
     * any additional information about the source
     * @param sourceId 
     * @return a new instance of the event detector.
     */
    abstract protected T createEventDetectorVO(int sourceId);

    /**
     * Reload any runtime data for this detector's source as the
     * detector was updated
     * @param vo
     */
    abstract public void restartSource(T vo);
    
    /**
     * Create a model from the VO
     * @param vo
     * @return
     */
    abstract public AbstractEventDetectorModel<T> createModel(AbstractEventDetectorVO<T> vo);
    
	/**
	 * Get the class of the model
	 * 
	 * @return
	 */
	abstract public Class<?> getModelClass();

    /**
     * Can this user create this detector?
     * 
     * @param user
     * @param vo
     * @return
     */
    public abstract boolean hasCreatePermission(PermissionHolder user, T vo);
	
	/**
	 * Can this user edit this detector?
	 * 
	 * @param user
	 * @param vo
	 * @return
	 */
    abstract public boolean hasEditPermission(PermissionHolder user, T vo);
    
    /**
     * Can this user view this detector?
     * 
     * @param user
     * @param vo
     * @return
     */
    abstract public boolean hasReadPermission(PermissionHolder user, T vo);
    
    /**
     * Used by MA core code to create a new event detector instances as required. Should not be used by client code.
     */
    public final T baseCreateEventDetectorVO(int sourceId) {
        T detector = createEventDetectorVO(sourceId);
        detector.setDefinition(this);
        return detector;
    }

}
