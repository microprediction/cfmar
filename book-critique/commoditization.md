# Commoditization and Unbundling of Prediction

## Summary

The book argues that prediction will become a commoditized service, unbundled from bespoke, high-cost projects and made available as a utility. This will enable widespread, low-cost access to predictive power, much like electricity or cloud computing.

## Pertinent Quotes

> "Unbundled microprediction can be a better path. Companies might become increasingly reliant on microprediction in a more direct way, over time. This can facilitate a critical mass of people and machines adopting similar standards."  
— Chapter 4: Economics

> "A developer should be able to create applications that are very light on the quant libraries and iterative work, yet draw enough power elsewhere."  
— Chapter 4: Economics

## Prescience

The book's vision of commoditized prediction has been partially realized through several concrete developments:

1. **Prediction APIs and Services**
   - The emergence of services like Google Cloud AI Platform, AWS SageMaker, and Azure ML that offer prediction as a service
   - AutoML platforms that automate model development and deployment
   - Specialized prediction APIs for specific domains (e.g., weather, traffic, financial markets)

2. **Real-World Examples**
   - The book specifically mentions developers accessing "hundreds of self-navigating algorithms using only a few lines of code" to predict:
     - Hospital wait times in New Jersey
     - BART train delays
     - Traffic delays for NYC bridges and tunnels
     - Twitter emoji usage patterns
     - Hacker News comment counts
   - These examples demonstrate the early stages of prediction commoditization

3. **Cost Reduction**
   - The book predicted that "you cannot purchase one dollar's worth of bespoke quantitative model creation"
   - Today, we see this changing with:
     - Open-source ML frameworks (TensorFlow, PyTorch)
     - Pre-trained models and transfer learning
     - Cloud-based ML services with pay-per-use pricing
     - Automated ML tools that reduce development time and cost

4. **Standardization**
   - The book's call for "minimalist protocols for repeated quantitative tasks" has been partially answered by:
     - Standard ML model formats (ONNX, PMML)
     - Common API protocols for prediction services
     - Containerization of ML models (Docker, Kubernetes)
     - Model serving frameworks (TensorFlow Serving, TorchServe)

However, the full vision of a "prediction web" where prediction is as ubiquitous as electricity remains aspirational. The current state shows progress in commoditization but still faces challenges in:
- Standardization across different domains
- True unbundling of prediction from specific applications
- Achieving the level of accessibility and ease-of-use predicted in the book
- Creating a truly competitive marketplace for predictions 






 Cost Reduction – Concrete Signals that “$1 of Bespoke Quant Is Hard to Buy”
Cost lever	What changed since the book	Representative evidence of $ saved / productivity gained
Pay-per-token, foundation-model APIs	Developers rent state-of-the-art language, vision and code-generation models rather than train them.	• Running Llama-3 8 B yourself on an AWS g6.xlarge is ≈ $600 / mo; the same 450 M tokens cost ≈ $135 via OpenAI’s GPT-4o-mini (450 M × $0.0003) — 78 % cheaper 
Discourse Meta
Auto-scaling inference endpoints	Fully-managed endpoints eliminate DevOps head-count while shrinking idle spend.	Neurolabs cut 70 % of compute cost and avoided two infra hires after moving to BentoML’s autoscaling endpoints 
BentoML
Serverless & pay-as-you-go compute	Fine-grained billing for milliseconds or requests replaces always-on servers.	FINRA’s market-surveillance pipeline now analyses 75 B events/day on AWS Lambda with no fleet management cost 
Amazon Web Services, Inc.
Right-sizing architecture after initial experimentation	Teams prototype cheaply on serverless, then consolidate when steady-state load is known.	Prime Video’s monitoring service moved from Step Functions + Lambda to an EC2 monolith and cut infra outlay by 90 % 
wudsn.com
Communications-as-an-API (Twilio)	Messaging, WhatsApp and voice bought “by the click” instead of carrier integrations.	Forrester TEI shows a 132 % three-year ROI; 3 % higher deliverability drives $1.4 M extra margin, while developer productivity rises 15 % 
Twilio
Payments-as-a-service (Stripe)	PCI-DSS, dispute handling and global acquiring rolled into a single REST call.	Forrester quantified 326 % ROI and $23 M NPV over three years for a composite enterprise on Stripe 
Stripe Events
Automated ML (AutoML/Vertex/GCP)	GUI-driven feature engineering & hyper-parameter search drop model build cycles from weeks to hours.	Consensus Corp cut deployment time from 3–4 weeks to 8 hours using AutoML 
AIMultiple
Open-source model registries / hosting	Hugging Face Inference Endpoints remove the GPU cap-ex for small-volume users.	Self-hosting Llama 3 8 B at low traffic costs ≈ 4× more than pay-per-call hosted endpoints, per community cost breakdown 
Discourse Meta

Key pattern: each win comes from narrow, metered APIs that externalise non-differentiating work—compliance, scaling, distributed systems, carrier contracts, or SGD tuning—into a commodity layer.

4 Standardization – The “Minimalist Protocols for Repeated Quant Tasks” Materialise
Layer	De-facto / formal standard	Why it matters	Proof of adoption
Portable model binaries	ONNX : unified graph IR for TF, PyTorch, JAX etc.	One artefact, many runtimes (Triton, TVM, TensorRT, WebGPU).	Officially supported by MSFT, Meta, NVIDIA; ONNX project tracks > 2 K forks 
onnx.ai
PMML 4.4	Older, still dominant for classic ML in banks; > 30 vendor implementations.	Data Mining Group lists 30 + compliant products 
Wikipedia
Model-as-a-container	Docker + OCI images	Guarantees byte-for-byte reproducibility from laptop to GPU farm.	All major clouds run OCI natively; K8s pods are OCI bundles (industry standard).
Inference micro-services	TensorFlow Serving, TorchServe, KServe, BentoML	Provide REST/gRPC contracts, batching, scale-to-zero.	TorchServe docs emphasise “minimal config for scalable remote access” 
Vultr Docs
; BentoML case above shows 9-month faster launch.
Workflow & deployment APIs	Kubernetes CRDs (KServe, Seldon), Amazon SageMaker Inference API, Google Vertex projects.locations.endpoints.predict	Declarative “one-liner” deployment replaces bespoke glue scripts.	Neurolabs daily model releases via BentoML CLI, zero infra touch points 
BentoML
Prediction request contract	REST/JSON, OpenAPI schemas, gRPC stubs	Enables code-gen clients and typed SDKs in any language.	99.95 % API uptime cited by Twilio for messaging interface 
Twilio
Data interchange	Apache Arrow, Parquet	Zero-copy columnar buffers across Python/Rust/JS speed preprocessing at negligible cost.	Adopted in Snowflake, BigQuery, Spark, lakehouse engines.
End-to-end metadata	MLflow, SageMaker Model Cards	Audit-ready provenance; supports automated promotion pipelines.	Hugging Face model cards use MLflow metadata when exported.

Result: Once a model has an ONNX file, an OCI container and an OpenAPI predict spec, you can:

Spin up a serverless endpoint on AWS SageMaker for pennies per 1 K inferences.

Swap-in a cheaper GPU spot deployment on-prem without code changes.

Hand the same artefact to a trading desk, a Snowflake UDF, or a mobile app.

Exactly the “minimalist, repeated” workflow the book envisaged.

Take-aways for a Quant / ML organisation
Strategic move	Immediate benefit
Adopt ONNX export as the only deliverable from research.	Eliminates framework lock-in and simplifies validation.
Enforce one declarative serving layer (e.g., KServe or BentoML) behind all live signals.	Ops team manages a single autoscaler; quants ship models with a Git tag.
Use commercial APIs first, revisit build-vs-buy only once traffic passes the break-even from case-studies above.	Mirrors Prime Video’s “prototype serverless, then optimise” path; prevents premature infra spend.

The up-shot: bespoke model creation is still expensive, but almost every supporting task—from feature engineering to payments to user notification—is now rentable by the millisecond. The cost curves and field reports above show why virtually every modern quant, fintech or SaaS stack is leaning on commodity APIs to stay competitive.







Sources
