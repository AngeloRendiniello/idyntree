classdef DynamicsRegressorGenerator < SwigRef
  methods
    function self = DynamicsRegressorGenerator(varargin)
      if nargin~=1 || ~ischar(varargin{1}) || ~strcmp(varargin{1},'_swigCreate')
        % How to get working on C side? Commented out, replaed by hack below
        %self.swigCPtr = iDynTreeMATLAB_wrap(277,'new_DynamicsRegressorGenerator',varargin{:});
        %self.swigOwn = true;
        tmp = iDynTreeMATLAB_wrap(277,'new_DynamicsRegressorGenerator',varargin{:}); % FIXME
        self.swigCPtr = tmp.swigCPtr;
        self.swigOwn = tmp.swigOwn;
        self.swigType = tmp.swigType;
        tmp.swigOwn = false;
      end
    end
    function delete(self)
      if self.swigOwn
        iDynTreeMATLAB_wrap(278,'delete_DynamicsRegressorGenerator',self);
        self.swigOwn=false;
      end
    end
    function varargout = loadRobotAndSensorsModelFromFile(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(279,'DynamicsRegressorGenerator_loadRobotAndSensorsModelFromFile',self,varargin{:});
    end
    function varargout = loadRobotAndSensorsModelFromString(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(280,'DynamicsRegressorGenerator_loadRobotAndSensorsModelFromString',self,varargin{:});
    end
    function varargout = loadRegressorStructureFromFile(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(281,'DynamicsRegressorGenerator_loadRegressorStructureFromFile',self,varargin{:});
    end
    function varargout = loadRegressorStructureFromString(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(282,'DynamicsRegressorGenerator_loadRegressorStructureFromString',self,varargin{:});
    end
    function varargout = isValid(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(283,'DynamicsRegressorGenerator_isValid',self,varargin{:});
    end
    function varargout = getNrOfParameters(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(284,'DynamicsRegressorGenerator_getNrOfParameters',self,varargin{:});
    end
    function varargout = getNrOfOutputs(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(285,'DynamicsRegressorGenerator_getNrOfOutputs',self,varargin{:});
    end
    function varargout = getNrOfDegreesOfFreedom(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(286,'DynamicsRegressorGenerator_getNrOfDegreesOfFreedom',self,varargin{:});
    end
    function varargout = getDescriptionOfParameter(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(287,'DynamicsRegressorGenerator_getDescriptionOfParameter',self,varargin{:});
    end
    function varargout = getDescriptionOfParameters(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(288,'DynamicsRegressorGenerator_getDescriptionOfParameters',self,varargin{:});
    end
    function varargout = getDescriptionOfOutput(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(289,'DynamicsRegressorGenerator_getDescriptionOfOutput',self,varargin{:});
    end
    function varargout = getDescriptionOfOutputs(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(290,'DynamicsRegressorGenerator_getDescriptionOfOutputs',self,varargin{:});
    end
    function varargout = getDescriptionOfDegreeOfFreedom(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(291,'DynamicsRegressorGenerator_getDescriptionOfDegreeOfFreedom',self,varargin{:});
    end
    function varargout = getDescriptionOfDegreesOfFreedom(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(292,'DynamicsRegressorGenerator_getDescriptionOfDegreesOfFreedom',self,varargin{:});
    end
    function varargout = getBaseLinkName(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(293,'DynamicsRegressorGenerator_getBaseLinkName',self,varargin{:});
    end
    function varargout = getSensorsModel(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(294,'DynamicsRegressorGenerator_getSensorsModel',self,varargin{:});
    end
    function varargout = setRobotState(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(295,'DynamicsRegressorGenerator_setRobotState',self,varargin{:});
    end
    function varargout = getSensorsMeasurements(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(296,'DynamicsRegressorGenerator_getSensorsMeasurements',self,varargin{:});
    end
    function varargout = computeRegressor(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(297,'DynamicsRegressorGenerator_computeRegressor',self,varargin{:});
    end
    function varargout = getModelParameters(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(298,'DynamicsRegressorGenerator_getModelParameters',self,varargin{:});
    end
    function varargout = computeFloatingBaseIdentifiableSubspace(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(299,'DynamicsRegressorGenerator_computeFloatingBaseIdentifiableSubspace',self,varargin{:});
    end
    function varargout = computeFixedBaseIdentifiableSubspace(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(300,'DynamicsRegressorGenerator_computeFixedBaseIdentifiableSubspace',self,varargin{:});
    end
    function [v,ok] = swig_fieldsref(self,i)
      v = [];
      ok = false;
      switch i
      end
    end
    function [self,ok] = swig_fieldasgn(self,i,v)
      switch i
      end
    end
  end
  methods(Static)
  end
end
