import React, {createContext, useEffect, useState} from "react";

const LeftColumnContext = createContext();

export const LeftColumnProvider = ({children}) => {
    const [dropDownClicked, setDropDownClicked] = useState("");
    const [cohortClicked, setCohortClicked] = useState("");
    const [cohorts, setCohorts] = useState([]);
    const [openDropDown, setOpenDropdown] = useState(null);
    const [students, setStudents] = useState([]);
    const [cohortId, setcohortId] = useState(1);
    const [cohortIdForInfo, setCohortIdForInfo] = useState(1);
    const [studentClicked, setStudentClicked] = useState("");

    const handleDropClicked = (value, id) =>{
        if(dropDownClicked === value){
            setDropDownClicked("")    
        }else{
            setDropDownClicked(value)
            setcohortId(id)
        } 
    }

    const handleCohortClicked = (cohort, id) => {
        if(cohortClicked === cohort){
            setCohortClicked("")
        }else{
            setCohortClicked(cohort)
            setCohortIdForInfo(id)   
        } 
    }

    // const handleStudentClicked = (student, id) => {
    //     if(studentClicked === student){
    //         setStudentClicked("")
    //     } else {
    //         setStudentClicked
    //     }
    // }
    
    useEffect(() => {
        fetch('http://localhost:8000/api/cohorts')
            .then(response => response.json())
            .then(data => setCohorts(data))
            .catch(error => console.log(error));
    }, []);

    useEffect(() => {
        fetch(`http://localhost:8000/api/cohorts/${cohortId}/students`)
            .then(response => response.json())
            .then(data => setStudents(data))
            .catch(error => console.log(error));
    }, [cohortId]);

    const toggleDropDown = (cohortId) => {
        if (openDropDown === cohortId) {
            setOpenDropdown(null);
        } else {
            setOpenDropdown(cohortId);
        }
    };

    return( <LeftColumnContext.Provider value = {{
        dropDownClicked,
        handleDropClicked,
        cohortClicked, 
        handleCohortClicked,
        cohorts,
        toggleDropDown,
        openDropDown,
        students,
        cohortId,
        cohortIdForInfo
    }}>
        {children}
    </LeftColumnContext.Provider>
    )
}

export default LeftColumnContext;