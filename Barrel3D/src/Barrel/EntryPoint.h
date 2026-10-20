#pragma once

#ifdef BR_PLATFORM_WINDOWS

extern Barrel::Application* Barrel::CreateApplication();
int main(int argc, char** argv)
{
	Barrel::Log::Init();
	BR_CORE_WARN("Initialized logging");
	BR_INFO("Initialized logging");
	// Sandbox* sandbox = new Sandbox();

	auto app = Barrel::CreateApplication();
	app->Run();
	delete app;
}

#endif