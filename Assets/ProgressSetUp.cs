using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProgressSetUp : MonoBehaviour {
	public Progress[] ProgressObjects;
	public float initialFillAmount = 100.0f;
	public float steps = -5.0f;

	// Use this for initialization
	void Start () {
		foreach (Progress prog in ProgressObjects) {
			prog.fillAmount = initialFillAmount;
		}
	}
	
	// Update is called once per frame
	void Update () {
		foreach (Progress prog in ProgressObjects) {
			if (prog.fillAmount > 100.0f) {
				prog.fillAmount = 100.0f;
				steps = -steps;
			} else if (prog.fillAmount < 0.0f) {
				prog.fillAmount = 0.0f;
				steps = -steps;
			}
			prog.fillAmount += steps;
		}
	}
}
