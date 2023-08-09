#version 450

/*シェーダへの入力*/
layout(location=0) in vec3 inPosition;
layout(location=1) in vec2 inTexcoord;
layout(location=2) in vec3 inNormal;

/*テクスチャ*/
layout(binding=0) uniform sampler2D texColor;

/*出力する色データ*/
out vec4 outColor;

/*平行高原パラメータ*/
struct DirectionalLight
{
	vec3 color;		//ライトの明るさ
	vec3 direction;	//ライトの向き
};

layout(location=100)uniform DirectionalLight directionLight;

void main()
{
	outColor = texture(texColor,inTexcoord);

	float invPi = 1 / acos(-1);//πの逆数
	/*線形補完によって長さが１ではなくなっているので、正規化して長さを１にする*/
	vec3 normal = normalize(inNormal);

	//ランベルトの世原則を使って明るさを計算
	float theta = max(dot(-directionLight.direction,normal),0);

	//拡散光の明るさを計算
	vec3 diffuse = directionLight.color * theta * invPi;

	//拡散光の影響を反映
	outColor.rgb *= diffuse;
}