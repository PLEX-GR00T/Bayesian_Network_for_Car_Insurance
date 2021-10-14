(defun make-insurance-net ()
  (let ((bn (make-bn :nodes nil)))
    (bn-add-node bn 'GoodStudent :tabulated  '( True False ))
    (bn-add-node bn 'Age :tabulated  '( Young Adult Senior ))
    (bn-add-node bn 'SocioEcon :tabulated  '( Lower Middle UpperMiddle Wealthy ))
    (bn-add-node bn 'RiskAversion :tabulated  '( Maniac Adventurous Normal Cautious ))
    (bn-add-node bn 'VehicleYear :tabulated  '( Current Older ))
    (bn-add-node bn 'OwnCarDamage :tabulated  '( None Mild Moderate Severe ))
    (bn-add-node bn 'Ruggedness :tabulated  '( TinCan Normal Tank ))
    (bn-add-node bn 'Accident :tabulated  '( None Mild Moderate Severe ))
    (bn-add-node bn 'MakeModel :tabulated  '( SportsCar Economy FamilySedan Luxury SuperLuxury ))
    (bn-add-node bn 'DrivingBehavior :tabulated  '( Poor Normal Excellent ))
    (bn-add-node bn 'Mileage :tabulated  '( FiveThou TwentyThou FiftyThou Extreme ))
    (bn-add-node bn 'SafetyFeatures :tabulated  '( True False ))
    (bn-add-node bn 'DrivingSkill :tabulated  '( SubStandard Normal Expert ))
    (bn-add-node bn 'YearsLicensed :tabulated  '( New Average Experienced ))
    (bn-add-node bn 'OwnCarCost :tabulated  '( Thousand TenThou HundredThou Million ))
    (bn-add-node bn 'Theft :tabulated  '( True False ))
    (bn-add-node bn 'CarValue :tabulated  '( FiveThou TenThou TwentyThou FiftyThou Million ))
    (bn-add-node bn 'Garaged :tabulated  '( Secure City Suburb Rural ))
    (bn-add-node bn 'AntiTheft :tabulated  '( True False ))
    (bn-add-node bn 'PropertyCost :tabulated  '( Thousand TenThou HundredThou Million ))
    (bn-add-node bn 'OtherCarCost :tabulated  '( Thousand TenThou HundredThou Million ))
    (bn-add-node bn 'ExtraCar :tabulated  '( True False ))
    (bn-add-node bn 'MedicalCost :tabulated  '( Thousand TenThou HundredThou Million ))
    (bn-add-node bn 'Cushioning :tabulated  '( Poor Fair Good Excellent ))
    (bn-add-node bn 'Airbag :tabulated  '( True False ))
    (bn-add-node bn 'LiabilityCost :tabulated  '( Thousand TenThou HundredThou Million ))
    (bn-add-node bn 'DrivingRecord :tabulated  '( Zero One Many ))

    (bn-add-parents bn 'GoodStudent '( SocioEcon Age ) )
    (bn-add-parents bn 'Age '() )
    (bn-add-parents bn 'Mileage '() )
    (bn-add-parents bn 'SocioEcon '( Age ) )
    (bn-add-parents bn 'RiskAversion '( Age SocioEcon ) )
    (bn-add-parents bn 'VehicleYear '( SocioEcon RiskAversion ) )
    (bn-add-parents bn 'OwnCarDamage '( Accident Ruggedness ) )
    (bn-add-parents bn 'Ruggedness '( MakeModel VehicleYear ) )
    (bn-add-parents bn 'Accident '( SafetyFeatures Mileage DrivingBehavior ) )
    (bn-add-parents bn 'MakeModel '( SocioEcon RiskAversion ) )
    (bn-add-parents bn 'DrivingBehavior '( DrivingSkill RiskAversion ) )
    (bn-add-parents bn 'SafetyFeatures '( MakeModel VehicleYear ) )
    (bn-add-parents bn 'DrivingSkill '( Age YearsLicensed ) )
    (bn-add-parents bn 'YearsLicensed '( Age ) )
    (bn-add-parents bn 'OwnCarCost '( OwnCarDamage CarValue Theft ) )
    (bn-add-parents bn 'Theft '( AntiTheft Garaged CarValue ) )
    (bn-add-parents bn 'CarValue '( MakeModel VehicleYear Mileage ) )
    (bn-add-parents bn 'Garaged '( RiskAversion SocioEcon ) )
    (bn-add-parents bn 'AntiTheft '( RiskAversion SocioEcon ) )
    (bn-add-parents bn 'PropertyCost '( OtherCarCost OwnCarCost ) )
    (bn-add-parents bn 'OtherCarCost '( Accident Ruggedness ) )
    (bn-add-parents bn 'ExtraCar '( SocioEcon ) )
    (bn-add-parents bn 'MedicalCost '( Accident Age Cushioning ) )
    (bn-add-parents bn 'Cushioning '( Ruggedness Airbag ) )
    (bn-add-parents bn 'Airbag '( MakeModel VehicleYear ) )
    (bn-add-parents bn 'LiabilityCost '( Accident ) )
    (bn-add-parents bn 'DrivingRecord '( YearsLicensed DrivingSkill RiskAversion ) )
    


    (bn-add-cpt bn 'GoodStudent
		'(
			(
				(0.1 0.9)
				(0.0 1.0)
				(0.0 1.0)
			)
		  	(	
				(0.2 0.8)
				(0.0 1.0)
				(0.0 1.0)
			)
		  	(	
				(0.5 0.5)
				(0.0 1.0)
				(0.0 1.0)
			)
		  	(	
				(0.4 0.6)
				(0.0 1.0)
				(0.0 1.0)
			)
		)
	 )
    (bn-add-cpt bn 'Age
		'( 0.2 0.6 0.2 ))
    (bn-add-cpt bn 'SocioEcon
		'(
			(0.40 0.40 0.19 0.01)
		  	(0.40 0.40 0.19 0.01)
		  	(0.50 0.20 0.29 0.01)
		)
	 )
    (bn-add-cpt bn 'RiskAversion
		'(	
			(
				(0.02 0.58 0.30 0.10)
				(0.02 0.38 0.50 0.10)
				(0.02 0.48 0.40 0.10)
				(0.02 0.58 0.30 0.10)
			)
		  	(	(0.015 0.285 0.500 0.200)
				(0.015 0.185 0.600 0.200)
				(0.015 0.285 0.500 0.200)
				(0.015 0.285 0.400 0.300)
			)
		  	(	(0.01 0.09 0.40 0.50)
				(0.01 0.04 0.35 0.60)
				(0.01 0.09 0.40 0.50)
				(0.01 0.09 0.40 0.50)
			)
		) 
	)
    (bn-add-cpt bn 'VehicleYear
		'(	
			(
				(0.15 0.85)
				(0.15 0.85)
				(0.15 0.85)
				(0.15 0.85)
			)
		  	(	(0.3 0.7)
				(0.3 0.7)
				(0.3 0.7)
				(0.3 0.7)
			)
		  	(	(0.8 0.2)			
				(0.8 0.2)
				(0.8 0.2)
				(0.8 0.2)
			)
		  	(	(0.9 0.1)
				(0.9 0.1)
				(0.9 0.1)
				(0.9 0.1)
			)	
		) 
	)
    (bn-add-cpt bn 'OwnCarDamage
		'(
			(
				(1.0 0.0 0.0 0.0)
				(1.0 0.0 0.0 0.0)
				(1.0 0.0 0.0 0.0)
			)
		  	(	
				(0.001 0.900 0.098 0.001)
				(0.200000 0.750000 0.049999 0.000001)
				(0.700000 0.290000 0.009999 0.000001)
			)
		  	(	
				(0.000001 0.000999 0.700000 0.299000)
				(0.001 0.099 0.800 0.100)
				(0.05 0.60 0.30 0.05)
			)
		  	(	
				(0.000001 0.000009 0.000090 0.999900)
				(0.000001 0.000999 0.009000 0.990000)
				(0.05 0.20 0.20 0.55)
			)
		) 
	)
    (bn-add-cpt bn 'Ruggedness
		'(
			(
				(0.95 0.04 0.01)
				(0.95 0.04 0.01)
			)
		  	(	
				(0.5 0.5 0.0)
				(0.9 0.1 0.0)
			)
		  	(	
				(0.2 0.6 0.2)
				(0.05 0.55 0.40)
			)
		  	(
				(0.1 0.6 0.3)
				(0.1 0.6 0.3)
			)
		  	(
				(0.05 0.55 0.40)
				(0.05 0.55 0.40)
			)
		)
	 )
    (bn-add-cpt bn 'Accident
		'(
			(
				(
					(0.70   0.20   0.07   0.03)
					(0.990  0.007  0.002  0.001)
					(0.9990 0.0007 0.0002 0.0001)
				)
		   		(	
					(0.4   0.3   0.2   0.1)
					(0.980 0.010 0.005 0.005)
					(0.995 0.003 0.001 0.001)
				)
		   		(
					(0.3   0.3   0.2   0.2)
					(0.970 0.020 0.007 0.003)
					(0.990 0.007 0.002 0.001)
				)
		   		(	 	
					(0.2   0.2   0.3   0.3)
					(0.95  0.03  0.01  0.01)	
					(0.985 0.010 0.003 0.002)
				)
			)
		  	(	
				(
					(0.6   0.2   0.1   0.1)
					(0.980 0.010 0.005 0.005)
					(0.995 0.003 0.001 0.001)
				)
		   		(
					(0.3   0.2   0.2   0.3)
					(0.960 0.020 0.015 0.005)
					(0.990 0.007 0.002 0.001)
				)
		   		(	
					(0.2   0.2   0.2   0.4)
					(0.950 0.030 0.015 0.005)
					(0.980 0.010 0.005 0.005)
				)
		   		(
					(0.1   0.1   0.3   0.5)
					(0.94  0.03  0.02  0.01)
					(0.980 0.010 0.007 0.003)
				)
			)
		) 
	)
    (bn-add-cpt bn 'MakeModel
		'(
			(
				(0.1 0.7 0.2 0.0 0.0)
				(0.1 0.7 0.2 0.0 0.0)
				(0.1 0.7 0.2 0.0 0.0)
				(0.1 0.7 0.2 0.0 0.0)
			)
		  	(
				(0.15 0.20 0.65 0.00 0.00)
				(0.15 0.20 0.65 0.00 0.00)
				(0.15 0.20 0.65 0.00 0.00)
				(0.15 0.20 0.65 0.00 0.00)
			)
		  	(
				(0.20 0.05 0.30 0.45 0.00)
				(0.20 0.05 0.30 0.45 0.00)
				(0.20 0.05 0.30 0.45 0.00)
				(0.20 0.05 0.30 0.45 0.00)
			)
		  	(
				(0.30 0.01 0.09 0.40 0.20)
				(0.30 0.01 0.09 0.40 0.20)
				(0.30 0.01 0.09 0.40 0.20)
				(0.30 0.01 0.09 0.40 0.20)
			)
		) 
	)
    (bn-add-cpt bn 'DrivingBehavior
		'(
			(
				(1.0 0.0 0.0)
				(1.0 0.0 0.0)
				(1.0 0.0 0.0)
				(1.0 0.0 0.0)
			)
		  	(
				(0.5 0.2 0.3)
				(0.3 0.4 0.3)
				(0.0 1.0 0.0)
				(0.0 0.8 0.2)
			)
		  	(	
				(0.3 0.2 0.5)
				(0.01 0.01 0.98)
				(0.0 0.0 1.0)
				(0.0 0.0 1.0)
			)
		) 
	)
    (bn-add-cpt bn 'Mileage
		'( 0.1 0.4 0.4 0.1 ))
    (bn-add-cpt bn 'SafetyFeatures
		'(
			(
				(0.9 0.1)
				(0.1 0.9)
			)
		  	(
				(0.001 0.999)
				(0.0 1.0)
			)
		  	(	
				(0.4 0.6)
				(0.0 1.0)
			)
		  	(
				(0.99 0.01)
				(0.3 0.7)
			)
		  	(	
				(0.99 0.01)
				(0.15 0.85)
			)
		) 
	)
    (bn-add-cpt bn 'DrivingSkill
		'(
			(
				(0.70 0.25 0.05)
		   		(0.50 0.45 0.05)
		   		(0.30 0.60 0.10)
			)
		  	(	
				(0.40 0.50 0.10)
		   		(0.20 0.60 0.20)
		   		(0.10 0.50 0.40)
			)
		  	(
				(0.70 0.25 0.05)
		   		(0.30 0.50 0.20)
		   		(0.25 0.60 0.15)
			)
		) 
	)
    (bn-add-cpt bn 'YearsLicensed
		'(
			(0.9 0.1 0.0)
		  	(0.1 0.6 0.3)
		  	(0.01 0.20 0.79)
		) 
	)
    (bn-add-cpt bn 'OwnCarCost
		'(
			(
				(
					(0.2 0.8 0.0 0.0)
					(1.0 0.0 0.0 0.0)
				)
		   		(
					(0.05 0.95 0.00 0.00)
					(1.0 0.0 0.0 0.0)
				)
		   		(
					(0.04 0.01 0.95 0.00)
					(1.0 0.0 0.0 0.0)
				)
		   		(
					(0.04 0.01 0.95 0.00)
					(1.0 0.0 0.0 0.0)
				)
		   		(
					(0.04 0.01 0.20 0.75)
					(1.0 0.0 0.0 0.0)
				)
			)
		  	(
				(
					(0.15 0.85 0.00 0.00)
					(0.95 0.05 0.00 0.00)
				)
		   		(
					(0.03 0.97 0.00 0.00)
					(0.95 0.05 0.00 0.00)
				)
		   		(
					(0.03 0.02 0.95 0.00)
					(0.99 0.01 0.00 0.00)
				)
		   		(
					(0.03 0.02 0.95 0.00)
					(0.99 0.01 0.00 0.00)
				)
		   		(
					(0.02 0.03 0.25 0.70)
					(0.98 0.01 0.01 0.00)
				)
			)
		  	(
				(
					(0.05 0.95 0.00 0.00)
					(0.25 0.75 0.00 0.00)
				)
		   		(	
					(0.01 0.99 0.00 0.00)
					(0.15 0.85 0.00 0.00)
				)
		   		(
					(0.001 0.001 0.998 0.000)
					(0.01 0.01 0.98 0.00)
				)
		   		(
					(0.001 0.001 0.998 0.000)
					(0.005 0.005 0.990 0.000)
				)
		   		(
					(0.001 0.001 0.018 0.980)
					(0.003 0.003 0.044 0.950)
				)
			)
		  	(
				(
					(0.03 0.97 0.00 0.00)
					(0.05 0.95 0.00 0.00)
				)
		   		(
					(0.000001 0.999999 0.000000 0.000000)
					(0.01 0.99 0.00 0.00)
				)
		   		(
					(0.000001 0.000001 0.999998 0.000000)
					(0.005 0.005 0.990 0.000)
				)
		   		(
					(0.000001 0.000001 0.999998 0.000000)
					(0.001 0.001 0.998 0.000)
				)
		   		(
					(0.000001 0.000001 0.009998 0.990000)
					(0.000001 0.000001 0.029998 0.970000)
				)
			)
		) 
	)
    (bn-add-cpt bn 'Theft
		'(
			(
				(
					(0.000001 0.999999)
					(0.000002 0.999998)
					(0.000003 0.999997)
					(0.000002 0.999998)
					(0.000001 0.999999)
				)
		   		(
					(0.0005 0.9995)
					(0.002 0.998)
					(0.005 0.995)
					(0.005 0.995)
					(0.000001 0.999999)
				)
		   		(	
					(0.00001 0.99999)
					(0.0001 0.9999)
					(0.0003 0.9997)
					(0.0003 0.9997)
					(0.000001 0.999999)
				)
		   		(
					(0.00001 0.99999)
					(0.00002 0.99998)
					(0.00005 0.99995)
					(0.00005 0.99995)
					(0.000001 0.999999)
				)
			)
		  	(
				(
					(0.000001 0.999999)
					(0.000002 0.999998)
					(0.000003 0.999997)
					(0.000002 0.999998)
					(0.000001 0.999999)
				)
		   		(
					(0.001 0.999)
					(0.005 0.995)
					(0.01 0.99)
					(0.01 0.99)
					(0.000001 0.999999)
				)
		   		(
					(0.00001 0.99999)
					(0.0002 0.9998)
					(0.0005 0.9995)
					(0.0005 0.9995)
					(0.000001 0.999999)
				)
		   		(	
					(0.00001 0.99999)
					(0.0001 0.9999)
					(0.0002 0.9998)
					(0.0002 0.9998)
					(0.000001 0.999999)
				)
			)
		) 
	)
    (bn-add-cpt bn 'CarValue
		'(
			(
				(
					(0.00 0.10 0.80 0.09 0.01)
					(0.00 0.10 0.80 0.09 0.01)
					(0.00 0.10 0.80 0.09 0.01)
					(0.00 0.10 0.80 0.09 0.01)
				)
		   		(
					(0.03 0.30 0.60 0.06 0.01)
					(0.16 0.50 0.30 0.03 0.01)
					(0.40 0.47 0.10 0.02 0.01)
					(0.90 0.06 0.02 0.01 0.01)
				)
			)
		  	(
				(
					(0.1 0.8 0.1 0.0 0.0)
					(0.1 0.8 0.1 0.0 0.0)
					(0.1 0.8 0.1 0.0 0.0)
					(0.1 0.8 0.1 0.0 0.0)
				)
		   		(
					(0.25 0.70 0.05 0.00 0.00)
					(0.7000 0.2999 0.0001 0.0000 0.0000)
					(0.990000 0.009999 0.000001 0.000000 0.000000)
					(0.999998 0.000001 0.000001 0.000000 0.000000)
				)
			)
		  	(	
				(
					(0.0 0.1 0.9 0.0 0.0)
					(0.0 0.1 0.9 0.0 0.0)
					(0.0 0.1 0.9 0.0 0.0)
					(0.0 0.1 0.9 0.0 0.0)
				)
		   		(		
					(0.2 0.3 0.5 0.0 0.0)
					(0.5 0.3 0.2 0.0 0.0)
					(0.7 0.2 0.1 0.0 0.0)
					(0.990000 0.009999 0.000001 0.000000 0.000000)
				)
			)
		  	(
				(
					(0.0 0.0 0.0 1.0 0.0)
					(0.0 0.0 0.0 1.0 0.0)
					(0.0 0.0 0.0 1.0 0.0)
					(0.0 0.0 0.0 1.0 0.0)
				)
		   		(
					(0.01 0.09 0.20 0.70 0.00)
					(0.05 0.15 0.30 0.50 0.00)
					(0.1 0.3 0.3 0.3 0.0)
					(0.2 0.2 0.3 0.3 0.0)
				)
			)
		  	(
				(
					(0.0 0.0 0.0 0.0 1.0)
					(0.0 0.0 0.0 0.0 1.0)
					(0.0 0.0 0.0 0.0 1.0)
					(0.0 0.0 0.0 0.0 1.0)
				)
		   		(
					(0.000001 0.000001 0.000001 0.000001 0.999996)
					(0.000001 0.000001 0.000001 0.000001 0.999996)
					(0.000001 0.000001 0.000001 0.000001 0.999996)
					(0.000001 0.000001 0.000001 0.000001 0.999996)
				)
			)
		) 
	)
    (bn-add-cpt bn 'Garaged
		'(
			(
				(0.000001 0.800000 0.049999 0.150000)
				(0.15 0.80 0.04 0.01)
				(0.35 0.60 0.04 0.01)
				(0.489999 0.500000 0.000001 0.010000))
		  	(	(0.000001 0.800000 0.050000 0.149999)
				(0.01 0.25 0.60 0.14)
				(0.2 0.4 0.3 0.1)
				(0.950000 0.000001 0.000001 0.049998))
		  	(	(0.000001 0.800000 0.050000 0.149999)
				(0.299999 0.000001 0.600000 0.100000)
				(0.500000 0.000001 0.400000 0.099999)
				(0.850000 0.000001 0.001000 0.148999))
		  	(	(0.000001 0.800000 0.050000 0.149999)
				(0.950000 0.000001 0.024445 0.025554)
				(0.999997 0.000001 0.000001 0.000001)
				(0.999997 0.000001 0.000001 0.000001))) )
    (bn-add-cpt bn 'AntiTheft
		'(
			(
				(0.000001 0.999999)
				(0.000001 0.999999)
				(0.05 0.95)
				(0.5 0.5))
		  	(	
				(0.000001 0.999999)
				(0.000001 0.999999)
				(0.2 0.8)
				(0.5 0.5))
		  	(
				(0.1 0.9)
				(0.3 0.7)
				(0.9 0.1)
				(0.8 0.2))
		  	(
				(0.95 0.05)
				(0.999999 0.000001)
				(0.999999 0.000001)
				(0.999999 0.000001)
			)
		)
	 )
    (bn-add-cpt bn 'PropertyCost
		'(
			(
				(0.7 0.3 0.0 0.0)
				(0.00 0.95 0.05 0.00)
				(0.00 0.00 0.98 0.02)
				(0.0 0.0 0.0 1.0))
		  	(
				(0.00 0.95 0.05 0.00)
				(0.0 0.6 0.4 0.0)
				(0.00 0.00 0.95 0.05)
				(0.0 0.0 0.0 1.0))
		  	(	
				(0.00 0.00 0.98 0.02)
				(0.0 0.0 0.8 0.2)
				(0.0 0.0 0.6 0.4)
				(0.0 0.0 0.0 1.0))
		  	(
				(0.0 0.0 0.0 1.0)
				(0.0 0.0 0.0 1.0)
				(0.0 0.0 0.0 1.0)
				(0.0 0.0 0.0 1.0)
			)
		) 
	)
    (bn-add-cpt bn 'OtherCarCost
		'(
			(
				(1.0 0.0 0.0 0.0)
				(1.0 0.0 0.0 0.0)
				(1.0 0.0 0.0 0.0))
		  	(
				(0.99000 0.00500 0.00499 0.00001)
				(9.799657e-01 9.999650e-03 9.984651e-03 4.999825e-05)
				(0.95000 0.03000 0.01998 0.00002))
		  	(	
				(0.60000 0.20000 0.19998 0.00002)
				(0.50000 0.20000 0.29997 0.00003)
				(0.40000 0.30000 0.29996 0.00004))
		  	(
				(0.20000 0.40000 0.39996 0.00004)
				(0.10000 0.50000 0.39994 0.00006)
				(0.0050 0.5500 0.4449 0.0001)
			)
		) 
	)
    (bn-add-cpt bn 'ExtraCar
		'(
			(0.5 0.5)
			(0.8 0.2)
			(0.9 0.1)
			(0.95 0.05)
		) 
	)
    (bn-add-cpt bn 'MedicalCost
		'(
			(
				(
					(1.0 0.0 0.0 0.0)
					(1.0 0.0 0.0 0.0)
					(1.0 0.0 0.0 0.0)
					(1.0 0.0 0.0 0.0))
		   		(
					(1.0 0.0 0.0 0.0)
					(1.0 0.0 0.0 0.0)
					(1.0 0.0 0.0 0.0)
					(1.0 0.0 0.0 0.0))
		   		(
					(1.0 0.0 0.0 0.0)
					(1.0 0.0 0.0 0.0)
					(1.0 0.0 0.0 0.0)
					(1.0 0.0 0.0 0.0))
			)
		  	(	
				(
					(0.960 0.030 0.009 0.001)
					(0.9800 0.0190 0.0009 0.0001)
					(0.99000 0.00990 0.00009 0.00001)
					(0.999000 0.000990 0.000009 0.000001))
		   		(
					(0.960 0.030 0.009 0.001)
					(0.9800 0.0190 0.0009 0.0001)
					(0.99000 0.00990 0.00009 0.00001)
					(0.999000 0.000990 0.000009 0.000001))
		   		(
					(0.90 0.07 0.02 0.01)
					(0.950 0.040 0.007 0.003)
					(0.970 0.025 0.003 0.002)
					(0.990 0.007 0.002 0.001))
			)
		  	(
				(
					(0.5 0.2 0.2 0.1)
					(0.80 0.15 0.03 0.02)
					(0.95 0.02 0.02 0.01)
					(0.990 0.007 0.002 0.001))
		   		(
					(0.5 0.2 0.2 0.1)
					(0.80 0.15 0.03 0.02)
					(0.95 0.02 0.02 0.01)
					(0.990 0.007 0.002 0.001))
		   		(
					(0.3 0.3 0.2 0.2)
					(0.5 0.2 0.2 0.1)
					(0.90 0.07 0.02 0.01)
					(0.95 0.03 0.01 0.01)
				)
			)
		  	(
				(
					(0.3 0.3 0.2 0.2)
					(0.5 0.2 0.2 0.1)
					(0.90 0.07 0.02 0.01)
					(0.95 0.03 0.01 0.01))
		   		(
					(0.3 0.3 0.2 0.2)
					(0.5 0.2 0.2 0.1)
					(0.90 0.07 0.02 0.01)
					(0.95 0.03 0.01 0.01))
		   		(
					(0.2 0.2 0.3 0.3)
					(0.3 0.3 0.2 0.2)
					(0.60 0.30 0.07 0.03)
					(0.90 0.05 0.03 0.02))
				)
			) 
	)
    (bn-add-cpt bn 'Cushioning
		'(
			(
				(0.5 0.3 0.2 0.0)
				(0.7 0.3 0.0 0.0))
			(
				(0.0 0.1 0.6 0.3)
				(0.1 0.6 0.3 0.0))
			(
				(0.0 0.0 0.0 1.0)
				(0.0 0.0 0.7 0.3))
			)
		 )
    (bn-add-cpt bn 'Airbag
		'(	
			(
				(1.0 0.0)
				(0.1 0.9))
			(
				(1.0 0.0)
				(0.05 0.95))
			(
				(1.0 0.0)
				(0.2 0.8))
			(	
				(1.0 0.0)
				(0.6 0.4))
			(
				(1.0 0.0)
				(0.1 0.9)
			)
		) 
	)
    (bn-add-cpt bn 'LiabilityCost
		'(
			(1.0 0.0 0.0 0.0)
			(0.999000 0.000998 0.000001 0.000001)
			(0.90 0.05 0.03 0.02)
			(0.80 0.10 0.06 0.04)
		) 
	)
    (bn-add-cpt bn 'DrivingRecord
		'(
		  (((0.02 0.28 0.70) ;;; new	sub	maniac
		    (0.08 0.42 0.50) ;;; 		advent
		    (0.20 0.60 0.20) ;;; 		normal
		    (0.60 0.30 0.10)) ;;; 		cautious

		   ((0.10 0.60 0.30) ;;; 	norm	maniac
		    (0.30 0.55 0.15) ;;; 		advent
		    (0.55 0.35 0.10) ;;; (Mistake: 0.55 0.25 0.10)normal
		    (0.80 0.18 0.02)) ;;; 		cautious

		   ((0.20 0.60 0.20) ;;; 	expert	maniac
		    (0.40 0.50 0.10) ;;; 		advent
		    (0.70 0.35 0.05) ;;; 		normal
		    (0.90 0.09 0.01)))  ;;; 		cautious

		  (((0.10 0.60 0.30) ;;; avg	sub	maniac
		    (0.30 0.55 0.15) ;;; 		advent
		    (0.55 0.35 0.10) ;;; (Mistake: 0.55 0.25 0.10)normal
		    (0.80 0.18 0.02)) ;;; 		cautious

		   ((0.20 0.60 0.20) ;;; 	norm	maniac
		    (0.40 0.50 0.10) ;;; 		advent
		    (0.70 0.25 0.05) ;;; 		normal
		    (0.90 0.09 0.01)) ;;; 		cautious

		   ((0.30 0.60 0.10) ;;; 	expert	maniac
		    (0.55 0.40 0.05) ;;; 		advent
		    (0.80 0.18 0.02) ;;; 		normal
		    (0.95 0.045 0.005))) ;;; 		cautious

		  (((0.20 0.60 0.20) ;;; expern	sub	maniac
		    (0.40 0.50 0.10) ;;; 		advent
		    (0.70 0.25 0.05) ;;; 		normal
		    (0.90 0.09 0.01)) ;;; 		cautious

		   ((0.30 0.60 0.10) ;;; 	norm	maniac
		    (0.55 0.40 0.05) ;;; 		advent
		    (0.80 0.18 0.02) ;;; 		normal
		    (0.950 0.045 0.005)) ;;; 		cautious

		   ((0.40 0.55 0.05) ;;; 	expert	maniac
		    (0.80 0.18 0.02) ;;; 		advent
		    (0.950 0.045 0.005) ;;; 		normal
		    (0.980 0.019 0.001))) ;;; 		cautious
			))
    bn))

(defvar *insurance-observables*)

(setf *insurance-observables* '(GoodStudent Age VehicleYear MakeModel Mileage YearsLicensed Garaged AntiTheft ExtraCar Airbag DrivingRecord))

(defun evidence-sample (bn evidence-variables)
  (let ((sample (prior-sample bn)))
    (dolist (bnode (bn-nodes bn))
      (unless (member (bnode-name bnode) evidence-variables :test #'eq)
	(setf (elt sample (bnode-index bnode)) nil)))
    sample))
;; typical case ADDS 41514976 MULTIPLIES 34056668
;; 64x + 16x + 4x

(defun consistent-events (e1 e2)
  "Return true iff the two events agree on all non-null values"
  (every #'(lambda (v1 v2) (or (null v1) (null v2) (equal v1 v2)))
         e1 e2))

;; joint probability P(A B C | e) = P(C | e) P(B | C e) p(A | B C e)


;; (defun joint-ask-by-name (Xnames e bn algorithm)
;;   (cond ((null Xnames) (error "Xnames empty"))
;; 	((null (cdr Xnames)) (funcall algorithm (first Xnames) e bn))
;; 	(t (

(defun count-consistent-events (e bn N &aux (count 0))
  "Return the number of events sampled from bn that are consistent with e"
  (dotimes (i N count)
    (when (consistent-events e (prior-sample bn)) (incf count))))

(defun max-norm-alist (p1 p2 &aux (m 0))
  (dolist (v.p p1 m)
    (setq m (max m (abs (- (cdr v.p) (afind (car v.p) p2)))))))

;;; p0 = exact result for e3 in2
;;; in2 = insurance net created as above
;;;e3 = #(2 1 1 NIL 0 NIL NIL 1 2 1 1 NIL 1 1 1 NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL)
;;;e4 = #(2 NIL 1 NIL 0 NIL NIL 1 2 1 1 NIL 1 1 1 NIL NIL NIL NIL NIL NIL 2 2 NIL NIL NIL 1)
;;;p4 = ((YOUNG . 0.10814372) (ADULT . 0.7907797) (SENIOR . 0.10107661))
;;;e5 = #(NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL 2 2 NIL NIL NIL 1)
;;;p5 = ((YOUNG . 0.38539654) (ADULT . 0.393159) (SENIOR . 0.22144447))

(defun expt1 () 
  (loop for i from 100000 to 1000000 by 100000 do 
        (print (list i 
                     (max-norm-alist p0 (rejection-sampling-ask-by-name 'propertycost e3 in2 i))
                     (max-norm-alist p0 (likelihood-weighting-ask-by-name 'propertycost e3 in2 i))))))
