#pragma once
#include "Core.h"

namespace Barrel {

	class BARREL_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// To be defined in the CLIENT
	Application* CreateApplication();

}