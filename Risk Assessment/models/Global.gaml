/***
* Name: Provinces
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/ @ no_experiment model RiskEstimate

import "Constants.gaml"
import "Functions.gaml"
import "Parameters.gaml"
import "species/AdministrativeBound.gaml"

global {

	init {
		if (do_init) {
			do initialisation;
			do init_infected_cases;
			do init_demograph; //			do init_transportation;
 }

	}

	action trigger_color {
		ask AdministrativeBound_1 {
			risk_point <- self.accessment();
			my_risk_color <- hsb(0, (risk_point > 0 ? 0.05 : 0) + ((risk_point / max_risk_point) < 0.75 ? (risk_point / max_risk_point) : 0.75), 1);
		}
		ask AdministrativeBound_2 {
			risk_point <- self.accessment();
			my_risk_color <- hsb(0, (risk_point > 0 ? 0.05 : 0) + ((risk_point / max_risk_point) < 0.75 ? (risk_point / max_risk_point) : 0.75), 1);
		}

	}

	action change_zoom_all {
		ask DetectedCase {
			do change_zoom;
		}

	}

	reflex run {
		do retrieve_cases;
	}

}