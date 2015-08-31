/*
 * Copyright (C) 2015 Fondazione Istituto Italiano di Tecnologia
 * Authors: Nuno Guedelha
 * CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT
 *
 */

#include <iDynTree/Core/LinearMotionVector3.h>
#include <iDynTree/Core/AngularMotionVector3.h>
#include <iDynTree/Core/Position.h>

namespace iDynTree
{
    /**
     * LinearMotionVector3Semantics
     */

    // constructors
    LinearMotionVector3Semantics::LinearMotionVector3Semantics()
    {
    }

    LinearMotionVector3Semantics::LinearMotionVector3Semantics(int _point, int _body, int _refBody, int _coordinateFrame):
    GeomVector3Semantics<LinearMotionVector3Semantics>(_body, _refBody, _coordinateFrame),
    point(_point)
    {
    }

    LinearMotionVector3Semantics::LinearMotionVector3Semantics(const LinearMotionVector3Semantics & other):
    GeomVector3Semantics<LinearMotionVector3Semantics>(other)
    {
    }

    LinearMotionVector3Semantics::~LinearMotionVector3Semantics()
    {
    }

    // Semantics operations
    bool LinearMotionVector3Semantics::changePoint(const PositionSemantics & newPoint,
                                                   const AngularMotionVector3Semantics & otherAngular,
                                                   LinearMotionVector3Semantics & resultLinear) const
    {
        // check semantics
        bool semantics_status =
        (   reportErrorIf(!checkEqualOrUnknown(newPoint.getCoordinateFrame(),this->coordinateFrame),
                          __PRETTY_FUNCTION__,
                          "newPoint expressed in a different coordinateFrame\n")
         && reportErrorIf(!checkEqualOrUnknown(newPoint.getReferencePoint(),this->point),
                          __PRETTY_FUNCTION__,
                          "newPoint has a reference point different from the original Motion vector point\n")/*
         && reportErrorIf(!checkEqualOrUnknown(newPoint.getBody(),newPoint.getRefBody()),
                          __PRETTY_FUNCTION__,
                          "newPoint point and reference point are not fixed to the same body\n")
         && reportErrorIf(!checkEqualOrUnknown(newPoint.getRefBody(),this->body),
                          __PRETTY_FUNCTION__,
                          "newPoint reference point and original Motion vector point are not fixed to the same body\n")*/
         && reportErrorIf(!checkEqualOrUnknown(otherAngular.getCoordinateFrame(),this->coordinateFrame),
                          __PRETTY_FUNCTION__,
                          "otherAngular expressed in a different coordinateFrame\n")
         && reportErrorIf(!checkEqualOrUnknown(otherAngular.getBody(),this->body),
                          __PRETTY_FUNCTION__,
                          "The bodies defined for both linear and angular force vectors don't match\n")
         && reportErrorIf(!checkEqualOrUnknown(otherAngular.getRefBody(),this->refBody),
                          __PRETTY_FUNCTION__,
                          "The reference bodies defined for both linear and angular force vectors don't match\n"));

        // compute semantics
        resultLinear = *this;
        resultLinear.point = newPoint.getPoint();

        return semantics_status;
    }

    bool LinearMotionVector3Semantics::compose(const LinearMotionVector3Semantics & op1,
                                               const LinearMotionVector3Semantics & op2,
                                               LinearMotionVector3Semantics & result)
    {
        // check semantics
        bool semantics_status =
        (   reportErrorIf(!checkEqualOrUnknown(op1.point,op2.point),
                          __PRETTY_FUNCTION__,
                          "op1 point and op2 point don't match\n")
         && GeomVector3Semantics<LinearMotionVector3Semantics>::compose(op1, op2, result));

        // compute semantics;
        result.point = op1.point;

        return semantics_status;
    }


    /**
     * LinearMotionVector3
     */

    // constructors
    LinearMotionVector3::LinearMotionVector3()
    {
    }

    LinearMotionVector3::LinearMotionVector3(const double* in_data, const unsigned int in_size):
    MotionVector3<LinearMotionVector3>(in_data, in_size)
    {
    }

    LinearMotionVector3::LinearMotionVector3(const LinearMotionVector3 & other):
    MotionVector3<LinearMotionVector3>(other)
    {
    }

    LinearMotionVector3::~LinearMotionVector3()
    {
    }

    /**
     * Geometric operations
     */
    const LinearMotionVector3 LinearMotionVector3::changePoint(const Position & newPoint,
                                                               const AngularMotionVector3 & otherAngular) const
    {
        LinearMotionVector3 resultLinear;

        iDynTreeAssert(this->semantics.changePoint(newPoint.getSemantics(), otherAngular.getSemantics(), resultLinear.semantics));

        Eigen::Map<const Vector3d> newPointMap(newPoint.data());
        Eigen::Map<const Vector3d> otherAngularMap(otherAngular.data());
        Eigen::Map<const Vector3d> thisMap(this->data());
        Eigen::Map<Vector3d> resultLinearMap(resultLinear.data());

        resultLinearMap = thisMap + newPointMap.cross(otherAngularMap);

        return resultLinear;
    }
}