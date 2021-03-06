﻿component extends="mxunit.framework.TestCase" {

	public void function setup(){
		inListConstraint = new hyrule.core.constraint.InListConstraint();
		user = new model.user();
	}
	
	public void function testValueInListReturnsTrue(){
		inListConstraint.setConstraintParameter("apples,oranges,bananas");
		assertTrue(inListConstraint.validate(user,"favSnack","apples"));
	}

	public void function testValueInListReturnsFalse(){
		inListConstraint.setConstraintParameter("apples,oranges,bananas");
		assertFalse(inListConstraint.validate(user,"favSnack","snickers"));
	}
	
	public void function testValueInListReturnsTrueCaseInsensitive(){
		inListConstraint.setConstraintParameter("apples,oranges,bananas");
		assertTrue(inListConstraint.validate(user,"favSnack","APPLES"));		
	}
		
	/**
	 * @mxunit:expectedException ConstrainedProperty.INLIST_CONSTRAINT
	 */
	public void function testNonStringConstraintParameterThrowsError() {
		inListConstraint.setConstraintParameter([]);
	}
	
}