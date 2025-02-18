import 'package:flutter/material.dart';
import 'package:vidilang/theme.dart';

class Transcription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, bottom: 20),
        child: Text(
          """
00:00 - 00:10 "Hi everyone, welcome to our channel! Today, we're going to discuss how AI is transforming our daily lives."
00:11 - 00:25 "Artificial intelligence is no longer just a concept for the future. It's here, and it's influencing everything from how we shop to how we communicate."
00:26 - 00:40 "For example, recommendation systems on platforms like Netflix or Amazon use AI to analyze your preferences and suggest content tailored to you."
00:41 - 01:00 "AI also plays a big role in healthcare. From diagnosing diseases to assisting in surgeries, AI is helping save lives every day."
01:01 - 01:20 "But with these advancements come challenges, like ethical concerns and data privacy issues. These are topics we need to address as AI continues to evolve."
01:21 - 01:30 "Thank you for watching! Don’t forget to like and subscribe for more videos on AI."

01:31 - 01:45 "Now, let's dive deeper into some real-world applications of AI. From self-driving cars to smart home assistants, AI is revolutionizing the way we interact with technology."
01:46 - 02:00 "Take Tesla’s autopilot feature, for example. It uses machine learning algorithms to analyze road conditions, predict traffic movements, and assist drivers in making safer decisions."
02:01 - 02:20 "Another great example is voice assistants like Alexa, Siri, and Google Assistant. They use natural language processing to understand our requests and provide relevant responses."
02:21 - 02:40 "Even in the gaming industry, AI is playing a crucial role. Game developers use AI to create intelligent NPCs that adapt to player behavior and enhance the gaming experience."
02:41 - 03:00 "But AI is not just limited to entertainment and convenience. It is also being used in environmental conservation efforts, analyzing climate patterns to predict natural disasters."
03:01 - 03:20 "For example, AI-powered satellite systems can monitor deforestation, track endangered species, and assist in sustainable agriculture practices."

03:21 - 03:40 "In the financial sector, AI is improving fraud detection. Banks and fintech companies use AI models to analyze transaction patterns and detect suspicious activities in real-time."
03:41 - 04:00 "The healthcare industry continues to benefit from AI advancements as well. AI-driven diagnostic tools help doctors detect diseases like cancer at an early stage, increasing survival rates."
04:01 - 04:20 "AI is also being used to develop personalized treatment plans for patients, taking into account their medical history, genetic makeup, and lifestyle factors."
04:21 - 04:40 "Despite all these incredible applications, there are still many concerns surrounding AI. Data privacy, ethical use of AI, and biases in algorithms are hot topics that need to be addressed."
04:41 - 05:00 "To ensure AI is used responsibly, governments and tech companies must work together to create policies that promote transparency and fairness in AI systems."
05:01 - 05:20 "As AI technology continues to evolve, it’s important for everyone to stay informed and engaged in discussions about its impact on society."
          """,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
