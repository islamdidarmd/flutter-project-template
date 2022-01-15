abstract class BaseUseCase<TInput, TOutput> {
  TOutput call(TInput param);
}
