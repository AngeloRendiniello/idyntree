classdef LinkArticulatedBodyInertias < SwigRef
  methods
    function this = swig_this(self)
      this = iDynTreeMEX(3, self);
    end
    function self = LinkArticulatedBodyInertias(varargin)
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if varargin{1}~=SwigRef.Null
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = iDynTreeMEX(669, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.swigPtr = [];
      end
    end
    function varargout = resize(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(670, self, varargin{:});
    end
    function varargout = isConsistent(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(671, self, varargin{:});
    end
    function varargout = paren(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(672, self, varargin{:});
    end
    function delete(self)
      if self.swigPtr
        iDynTreeMEX(673, self);
        self.swigPtr=[];
      end
    end
  end
  methods(Static)
  end
end