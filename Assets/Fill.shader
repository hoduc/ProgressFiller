// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/Fill" {
   Properties {
   	  _FillAmount ( "Fill Amount", Range(-1,1) ) = 0.75
   	  _Base ("Base Color", Color) = (1,0,0,1)
   	  _Progress( "Progress Color", Color) = (0,1,0,1)
   	  _ObjectWorldPosition( "Test", Vector) = (0,0,0,0)
   }
   SubShader {
      Pass {
         Cull Off // turn off triangle culling, alternatives are:
         // Cull Back (or nothing): cull only back faces 
         // Cull Front : cull only front faces
 
         CGPROGRAM 
         #pragma vertex vert  
         #pragma fragment frag 

         float _FillAmount = 0.75;
         float4 _Base; //= float4(0.0, 1.0, 0.0, 1.0);
         float4 _Progress; //= float4(1.0, 0.0, 0.0, 1.0);
         float4 _ObjectWorldPosition;
         struct vertexInput {
            float4 vertex : POSITION;
         };
         struct vertexOutput {
            float4 pos : SV_POSITION;
            float4 posInObjectCoords : TEXCOORD0;
            float4 worldSpacePosition : TEXCOORD1;
         };
 
         vertexOutput vert(vertexInput input) 
         {
            vertexOutput output;
 
            output.pos =  UnityObjectToClipPos(input.vertex);
            output.posInObjectCoords = input.vertex; 
 	  		output.worldSpacePosition = mul(unity_ObjectToWorld, input.vertex);
            return output;
         }
 
         float4 frag(vertexOutput input) : COLOR 
         {
            if ((input.worldSpacePosition.y - _ObjectWorldPosition.y) > _FillAmount)
            {
               return _Base;
            }
            return _Progress;
         }
 
         ENDCG  
      }
   }
}