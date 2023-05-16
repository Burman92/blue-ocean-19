import React, { useContext } from "react";
import LeftColumnContext from "../../context/LeftColumnContext";
import "../../../src/styles/LeftColumn.css";
import LeftColumnNames from "./LeftColumnNames";

function LeftColumnDrop() {
	const {
		handleDropClicked,
		dropDownClicked,
		cohortClicked,
		handleCohortClicked,
		cohorts,
		openDropDown,
		toggleDropDown,
	} = useContext(LeftColumnContext);

	return (
		<>
			{cohorts.map((cohort, index) => {
				const buttonClass =
					cohortClicked === cohort.courseid ? "LCwasClicked" : "LCnotClicked";
				const arrowClass =
					dropDownClicked === cohort.courseid ? "LCADown" : "LCAUp";
				return (
					<>
						<div
							key={index}
							className={`leftColumnDrop ${buttonClass}`}
						>
							<div
								className='LcCohort'
								onClick={() =>
									handleCohortClicked(cohort.courseid, cohort.id - 1)
								}
							>
								{cohort.courseid}
							</div>
							<i
								className={`leftColumnArrow ${arrowClass}`}
								onClick={() => {
									handleDropClicked(cohort.courseid, cohort.id);
									toggleDropDown(cohort.courseid);
								}}
							></i>
						</div>
						{openDropDown === cohort.courseid && <LeftColumnNames />}
					</>
				);
			})}
		</>
	);
}

export default LeftColumnDrop;
