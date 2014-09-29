/*
 * Copyright (C) 2011-2014 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * This file is auto-generated. DO NOT MODIFY!
 * The source Renderscript file: cts/tests/tests/rscpp/librscpptest/setelementat.rs
 */

#include "RenderScript.h"

using namespace android::RSC;

/* This class encapsulates access to the exported elements of the script.  Typically, you
 * would instantiate this class once, call the set_* methods for each of the exported global
 * variables you want to change, then call one of the forEach_ methods to invoke a kernel.
 */
class ScriptC_setelementat : public android::RSC::ScriptC {
private:
    /* For each non-const variable exported by the script, we have an equivalent field.  This
     * field contains the last value this variable was set to using the set_ method.  This may
     * not be current value of the variable in the script, as the script is free to modify its
     * internal variable without changing this field.  If the script initializes the
     * exported variable, the constructor will initialize this field to the same value.
     */
    int32_t mExportVar_memset_toValue;
    int32_t mExportVar_compare_value;
    int32_t mExportVar_compare_failure;
    int32_t mExportVar_failure_value;
    uint32_t mExportVar_dimX;
    uint32_t mExportVar_dimY;
    android::RSC::sp<const android::RSC::Allocation> mExportVar_array;
    /* The following elements are used to verify the types of allocations passed to kernels.
     */
    android::RSC::sp<const android::RSC::Element> __rs_elem_I32;
public:
    ScriptC_setelementat(android::RSC::sp<android::RSC::RS> rs);
    virtual ~ScriptC_setelementat();

    /* Methods to set and get the variables exported by the script. Const variables will not
     * have a setter.
     * 
     * Note that the value returned by the getter may not be the current value of the variable
     * in the script.  The getter will return the initial value of the variable (as defined in
     * the script) or the the last value set by using the setter method.  The script is free to
     * modify its value independently.
     */
    void set_memset_toValue(int32_t v) {
        setVar(0, &v, sizeof(v));
        mExportVar_memset_toValue = v;
    }

    int32_t get_memset_toValue() const {
        return mExportVar_memset_toValue;
    }

    void set_compare_value(int32_t v) {
        setVar(1, &v, sizeof(v));
        mExportVar_compare_value = v;
    }

    int32_t get_compare_value() const {
        return mExportVar_compare_value;
    }

    void set_compare_failure(int32_t v) {
        setVar(2, &v, sizeof(v));
        mExportVar_compare_failure = v;
    }

    int32_t get_compare_failure() const {
        return mExportVar_compare_failure;
    }

    void set_failure_value(int32_t v) {
        setVar(3, &v, sizeof(v));
        mExportVar_failure_value = v;
    }

    int32_t get_failure_value() const {
        return mExportVar_failure_value;
    }

    void set_dimX(uint32_t v) {
        setVar(4, &v, sizeof(v));
        mExportVar_dimX = v;
    }

    uint32_t get_dimX() const {
        return mExportVar_dimX;
    }

    void set_dimY(uint32_t v) {
        setVar(5, &v, sizeof(v));
        mExportVar_dimY = v;
    }

    uint32_t get_dimY() const {
        return mExportVar_dimY;
    }

    void set_array(android::RSC::sp<const android::RSC::Allocation> v) {
        setVar(6, v);
        mExportVar_array = v;
    }

    android::RSC::sp<const android::RSC::Allocation> get_array() const {
        return mExportVar_array;
    }

    // No forEach_root(...)
    /* For each kernel of the script corresponds one method.  That method queues the kernel
     * for execution.  The kernel may not have completed nor even started by the time this
     * function returns.  Calls that extract the data out of the output allocation will wait
     * for the kernels to complete.
     */
    void forEach_memset(android::RSC::sp<const android::RSC::Allocation> aout);
    void forEach_compare(android::RSC::sp<const android::RSC::Allocation> ain);
    void forEach_getCompareResult(android::RSC::sp<const android::RSC::Allocation> aout);
    void forEach_setLargeArray(android::RSC::sp<const android::RSC::Allocation> ain);
    void forEach_setLargeArray2D(android::RSC::sp<const android::RSC::Allocation> ain);
};

