using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Progress : MonoBehaviour {
	private Renderer rend;
	public float fillAmount = 75.0f;

	private readonly string FILLPROP = "_FillAmount";
	private readonly string OBJECTWORLDPOSPROP = "_ObjectWorldPosition";

	void fillObject(Renderer rend, float fillAmount, Vector4 objectWorldPosition) {
		rend.material.SetFloat (FILLPROP, fillAmountToObjectSpace(fillAmount));
		rend.material.SetVector (OBJECTWORLDPOSPROP, objectWorldPosition);	
	}	

	//[0,100] - > [-1,1]
	float fillAmountToObjectSpace(float amount) {
		return (amount / 100.0f) * 2.0f - 1.0f;//((amount * 2.0f) / 100.0f) - 1.0f;
	}
	
	// Use this for initialization
	void Start () {
		rend = GetComponent<Renderer> ();
	}
	
	// Update is called once per frame
	void Update () {
		fillObject (rend, fillAmount, new Vector4 (transform.position.x, transform.position.y, transform.position.z, 1.0f));
	}
}
